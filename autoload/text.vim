function! text#indent(i)
  let cur_line = line(".")
  let last_line = line("$")
  let cur_ind = indent(cur_line)
  let start_line = cur_line
  let end_line = cur_line

  while (indent(start_line - a:i) >= cur_ind || ((start_line - a:i) >= 0 && getline(start_line - a:i) == ''))
    let start_line = start_line - 1
  endw
  while (indent(end_line + a:i) >= cur_ind || ((end_line + a:i) <= last_line && getline(end_line + a:i) == ''))
    let end_line = end_line + 1
  endw

  exe "normal " . start_line . "G"
  exe "normal V"
  exe "normal " . end_line . "G"
endfunction
