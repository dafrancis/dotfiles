let s:settings = ['g:test_opener_swap_script', 'g:test_opener_swap_test', 'g:test_opener_file_prefix']

function! s:IsTest(filename)
  " Check if file is a test
  if s:SettingsExist()
    let matches_test_dir = match(a:filename, g:test_opener_swap_test)
    let matches_prefix = match(a:filename, '/' . g:test_opener_file_prefix)
    return matches_test_dir && matches_prefix
  endif
endfunction

function! s:SettingsExist()
  " Check if the settings for this plugin are set
  for setting in s:settings
    if !exists(setting)
      echoerr setting . ' is not set'
      return 0
    endif
  endfor
  return 1
endfunction

function! s:CreateRelated()
  " Open/Create related spec/file
  if s:SettingsExist()
    let related = s:GetRelatedFile(expand('%:p'))
    call s:Open(related)
  endif
endfunction

function s:SwitchScript(file)
  " Subsitutes file
  let regex = '\([^/]\+\)$'
  let prefix = g:test_opener_file_prefix
  if s:IsTest(a:file)
    return substitute(a:file, prefix . regex, '\1', '')
  else
    return substitute(a:file, regex, prefix . '\1', '')
  endif
endfunction

function! s:SwapDirectory(file)
  " Swaps directory
  let file1 = g:test_opener_swap_test
  let file2 = g:test_opener_swap_script
  if s:IsTest(a:file)
    return substitute(a:file, file1, file2, '')
  else
    return substitute(a:file, file2, file1, '')
  endif
endfunction

function! s:GetRelatedFile(file)
  " Return the related filename
  let subsituted_file = s:SwitchScript(a:file)
  return s:SwapDirectory(subsituted_file)
endfunction

function! s:Open(file)
  " Open the related file in a vsplit
  exec('vsplit ' . a:file)
endfunction

" Register a new command `AC` for open/create a related file
command! AC :call <SID>CreateRelated()
