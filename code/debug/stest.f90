program stest
use sorting

real*8 a(5)
  a(:) = 0D0
  a(1) = 3D0
  a(2) = 1.5D0
  call ssort_asc(a(:), a(:), 5)
  write(*,*) a(:)
end program stest