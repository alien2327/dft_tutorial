program sort_1
!   Purpose:
!       To read in a real input data set, sort it into ascending order
!       using the selection sort algorithm, and to write the sorted
!       data to the standard output device.
!
!   Record of revisions:
!       Date        Programmer      Description of change
!       ====        ==========      =====================
!    2021/09/06     Y.H.LEE         Original code
    implicit none

    !   Data dictionary: declare constants
    integer, parameter :: MAX_SIZE = 10

    !   Data dictionary: declare variable types and definitions
    real, dimension(MAX_SIZE) :: a  !   Data array to sort
    character(len=20) :: filename   !   Input data file name
    character(len=80) :: msg        !   Error message
    integer i, j                    !   Loop index
    integer ptr                     !   Pointer to smallest value
    integer :: nvals = 0            !   Number of data values to sort
    integer :: status               !   I/O status: 0 for success, 1 for failed
    real :: temp                    !   Temporary variable for swapping

    !   Get the name of the file containing the input data.
    write (*,1000)
    1000 format ('Enter the file name with the data to be sorted: ')
    read (*, '(A20)') filename

    !   Open input data file.
    open ( unit=9, file=filename, status='old', action='read', iostat=status, iomsg=msg)

    fileopen: if (status == 0) then
        !   The file was opened successfully
        do
            read (9, *, iostat=status) temp !   Get value
            if (status/=0) exit             !   Exit on end of data
            nvals = nvals + 1               !   Bump count
            a(nvals) = temp                 !   Save value in array
        end do

        outer: do i = 1, nvals-1
            !   Find the minimum value in a(i) through a(nvals)
            ptr = i
            inner: do j = i+1, nvals
                minval: if (a(j) < a(ptr)) then
                    ptr = j
                end if minval
            end do inner

            !   ptr now points to the minimum value, so swap a(ptr) with
            !   a(i) if i /= ptr.
            swap: if (i/=ptr) then
                temp = a(i)
                a(i) = a(ptr)
                a(ptr) = temp
            end if swap

        end do outer

        !   Write down the sorted data
        write (*, '(A)') 'The sorted output data values are: '
        write (*, '(3X, F10.4)') (a(i), i = 1, nvals)
    else
        write (*, 1050) trim(msg)
        1050 format ('ERROR: File open failed = ', A)
    end if fileopen
end program sort_1
