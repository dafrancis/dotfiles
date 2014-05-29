function! s:IsTest(filename)
    " Check if file is a test
    if !(exists("g:test_opener_swap_test") && exists("g:test_opener_file_prefix"))
        echoerr "There is no swap test or file prefix set"
    else
        return match(a:filename, g:test_opener_swap_test) && match(a:filename, '/' . g:test_opener_file_prefix)
    endif
endfunction

function! s:CreateRelated()
    " Open/Create related spec/file
    if !(exists("g:test_opener_swap_test") && exists("g:test_opener_file_prefix") && exists("g:test_opener_swap_script"))
        echoerr "No settings found"
        return
    endif
    let related = s:GetRelatedFile(expand('%:p'))
    call s:Open(related)
endfunction

function! s:GetRelatedFile(file)
    " Return the related filename
    if s:IsTest(a:file)
        let file_regex = g:test_opener_file_prefix . "\\([^/]\\+\\)$"
        let file_replace_str = "\\1"
        let folder_1 = g:test_opener_swap_test
        let folder_2 = g:test_opener_swap_script
    else
        let file_regex = "\\([^/]\\+\\)$"
        let file_replace_str = g:test_opener_file_prefix . "\\1"
        let folder_1 = g:test_opener_swap_script
        let folder_2 = g:test_opener_swap_test
    endif
    return substitute(substitute(a:file, file_regex, file_replace_str, ""), folder_1, folder_2, '')
endfunction

function! Open(file)
    " Open the related file in a vsplit
    exec('vsplit ' . a:file)
endfunction

" Register a new command `AC` for open/create a related file
command! AC :call <SID>CreateRelated()
