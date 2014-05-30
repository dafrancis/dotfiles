let s:settings = ['g:test_runner_base_dir', 'g:test_runner_command']

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

function! s:GetTestList()
    " Get the test list
    if !exists('g:test_runner_matches')
        return []
    else
        return g:test_runner_matches
    endif
endfunction

function! s:IsTest(filename)
    " Check if file is a test
    let test_list = s:GetTestList()
    for var in test_list
        if match(a:filename, var) < 0
            return 0
        endif
    endfor
    return 1
endfunction

function! s:SetThisRunner(filename)
    " Run the current test file
    let test_path = split(a:filename, g:test_runner_base_dir)
    let g:grb_runner_file = test_path[-1]
endfunction

function! s:RunCommandIfExists()
    " Runs a test if there is one set
    if exists('g:test_runner_file')
        let change_directory = 'cd ' . g:test_runner_base_dir . ';'
        let run_test = g:test_runner_command . ' ' . g:test_runner_base_dir
        exec ':!clear;' . change_directory . run_test
    else
        echoerr 'Error: no test to run!'
    endif
endfunction

function! s:RunTest()
    " Run a test
    if s:SettingsExist()
        let filename = expand('%:p')
        if s:IsTest(filename)
            call s:SetThisRunner(filename)
        endif
        call s:RunCommandIfExists()
    endif
endfunction

command! RunTest :call <SID>RunTest()

