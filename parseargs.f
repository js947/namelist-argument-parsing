program parseargs
  integer :: i, j

  integer :: iostat
  character(:), allocatable :: iomsg, s

  namelist /cmd/ i, j

  i = 1
  j = 99
  print *, i, j

  s = "&cmd "//get_arg()//"\"

  read(s, nml=cmd, iostat=iostat, iomsg=iomsg)

  print *, i, j

contains

  function get_arg() result(s)
    character(:), allocatable :: s, a
    integer :: l

    do i = 1, command_argument_count()
      call get_command_argument(i, length=l)
      allocate(character(l) :: a)
      call get_command_argument(i, value=a)
      s = s//a//" "
      deallocate(a)
    end do
  end function

end program
