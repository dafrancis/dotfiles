function! IsTest(filename)
    " Check if file is a test
    if !exists("g:test_runner_matches")
        let test_list = []
    else
        let test_list = g:test_runner_matches
    endif
    for var in test_list
        if match(a:filename, var) < 0
            return 0
        endif
    endfor
    return 1
endfunction

function! SetThisRunner(filename)
    " Run the current test file
    let test_path=split(a:filename, g:test_runner_base_dir)
    let g:grb_runner_file='cd ' . g:test_runner_base_dir . ';' . g:test_runner_command . ' ' . test_path[-1]
endfunction

function! RunTest()
    " Run a test
    if !(exists("g:test_runner_base_dir") && exists("g:test_runner_command"))
        echo "Error: base dir or command not set!"
        return
    endif
    let filename=expand('%:p')
    if IsTest(filename)
        call SetThisRunner(filename)
    endif
    if exists("g:grb_runner_file")
        exec ":!clear;" . g:grb_runner_file
    else
        echo "Error: there's no test to run!"
    endif
endfunction
