program program_01
implicit none
integer, parameter :: dp=kind(0.d0)
real(dp) :: a
integer :: i
print *, "Normal random numbers:"
do i = 1, 10
    call rand(a)
    print *, a
end do

contains

    subroutine rand(x)
    ! Returns a psuedorandom scalar drawn from the standard normal distribution.
    !
    ! [1] Marsaglia, G., & Bray, T. A. (1964). A Convenient Method for
    !       Generating Normal Variables. SIAM Review, 6(3), 260–264.
    real(dp), intent(out) :: x
    logical, save :: first = .true.
    real(dp), save :: u(2)
    real(dp) :: r2
    if (first) then
        do
            call random_number(u)
            u = 2*u-1
            r2 = sum(u**2)
            if (r2 < 1 .and. r2 > 0) exit
        end do
        u = u * sqrt(-2*log(r2)/r2)
        x = u(1)
    else
        x = u(2)
    end if
    first = .not. first
    end subroutine

end program
