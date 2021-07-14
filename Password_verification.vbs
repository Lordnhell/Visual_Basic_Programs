'Correct Password gives access to program that calculates area of 1 of three shapes 

Module Module1

    Sub triarea(ByVal length As Integer, ByVal height As Integer)
        Dim area As Integer

        area = 0.5 * length * height

        Console.WriteLine("area equals = " & area)
    End Sub

    Sub triperimeter(ByVal length As Integer, ByVal side1 As Integer, ByVal side2 As Integer)
        Dim perimeter As Integer

        perimeter = length + side1 + side2

        Console.WriteLine("perimeter equals = " & perimeter)

    End Sub
    Function validatepassword(ByVal instring As String) As Boolean
        Dim lcasechar, ucasechar, i As Integer
        Dim nextchar As Char
        Dim returnflag As Boolean

        returnflag = True
        lcasechar = 0
        ucasechar = 0

        For i = 1 To Len(instring)
            nextchar = Mid(instring, i, 1)
            If nextchar >= "a" And nextchar <= "z" Then
                lcasechar = lcasechar + 1
            Else

                If nextchar >= "A" And nextchar <= "Z" Then
                    ucasechar = ucasechar + 1
                Else
                    returnflag = False
                End If
            End If
        Next

        If Not (ucasechar >= 2 And lcasechar >= 6) Then
            returnflag = False
        End If

        validatepassword = returnflag

    End Function

    Sub Main()
        Dim choice, length, height, side1, side2 As Integer
        Dim ans, passwordcheck As Integer
        Dim password, accesskey As String
        Dim returnflag, passwordflag As Boolean

        passwordflag = False
        passwordcheck = 0
        ans = 1

        Console.WriteLine("Hello there! We are going to help you make a good password today")
        Console.WriteLine(" ")
        Console.WriteLine("Go ahead and put in a password and we'll let you know what changes to make!")
        Console.WriteLine(" ")

        Do Until returnflag = True


            password = Console.ReadLine()

            returnflag = validatepassword(password)

            If returnflag = False Then
                Console.WriteLine("")
                Console.WriteLine("Your password " & password & " has to have atleast 2 uppercase letters and atleast 6 lowercase letters")
                Console.WriteLine("Try again?")
                Console.WriteLine("")

            Else
                Console.WriteLine("Your good to go! Now remember it!")

            End If

        Loop

        Console.WriteLine(" ")
        Console.WriteLine("Please enter you password you made earlier to access the program.")
        Console.WriteLine(" ")

        Do Until passwordcheck = 2 Or passwordflag = True

            accesskey = Console.ReadLine()

            If accesskey <> password Then
                passwordflag = False
            Else
                passwordflag = True

            End If


            If passwordflag = False Then
                Console.WriteLine("Sorry, the passwords do not match.")
                Console.WriteLine(" ")
                Console.WriteLine("You have 1 more try")
                passwordcheck = passwordcheck + 1
            Else
                Console.WriteLine("Great! passwords match!")
                Console.WriteLine(" ")

                Do While ans <> 0

                    Console.WriteLine("this is a program for caclulating the area and perimeter of a triangle. ")
                    Console.WriteLine("for calculating area only, enter 1")
                    Console.WriteLine("for calculationg perimeter only, enter 2")
                    Console.WriteLine("for calculating both, enter 3")
                    choice = Console.ReadLine()

                    Select Case choice
                        Case 1

                            Console.WriteLine("enter the base length")
                            length = Console.ReadLine()
                            Console.WriteLine("enter the height")
                            height = Console.ReadLine()

                            triarea(length, height)

                        Case 2
                            Console.WriteLine("enter the base length")
                            length = Console.ReadLine()
                            Console.WriteLine("enter the first side")
                            side1 = Console.ReadLine()
                            Console.WriteLine("enter the second side")
                            side2 = Console.ReadLine()

                            triperimeter(length, side1, side2)

                        Case 3
                            Console.WriteLine("enter the base length")
                            length = Console.ReadLine()
                            Console.WriteLine("enter the height")
                            height = Console.ReadLine()
                            Console.WriteLine("enter the first side")
                            side1 = Console.ReadLine()
                            Console.WriteLine("enter the second side")
                            side2 = Console.ReadLine()

                            triarea(length, height)
                            triperimeter(length, side1, side2)

                    End Select

                    Console.WriteLine(" ")
                    Console.WriteLine("want to continue? Enter 1 to continue, 0 to otherwise.")
                    ans = Console.ReadLine()

                Loop



            End If
        Loop


    End Sub

End Module