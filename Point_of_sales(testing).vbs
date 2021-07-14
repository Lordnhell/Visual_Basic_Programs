Module Module1
    Function validatepassword(ByVal password As String)

        Dim returnflag As Boolean

        returnflag = False

        If password = "cashierpass" Then
            returnflag = True
        End If
        validatepassword = returnflag
    End Function

    Function changecalculation(ByVal amountreceived As Integer, ByVal totalcost As Integer)

        Dim change As Integer

        change = amountreceived - totalcost
        changecalculation = change
    End Function
    Sub Main()

        Dim password As String
        Dim keycheck, choicecheck, amountcheck As Boolean
        Dim numtries, totalcost, amountreceived, change, choice As Integer

        numtries = 3
        keycheck = False
        choicecheck = False
        amountcheck = False
        amountreceived = 0
        totalcost = 0
        choice = 5

        Console.WriteLine("ice cream truck PTE LTD")
        Console.WriteLine("")
        Console.WriteLine("")
        Console.WriteLine("please enter password to access (its cashierpass)")

        Do Until numtries = 0 Or keycheck = True
            password = Console.ReadLine()

            keycheck = validatepassword(password)


            If keycheck = False Then
                Console.WriteLine("")
                Console.WriteLine("password incorrect, you have " & numtries & " more tries")
                numtries = numtries - 1
            End If

        Loop




        Console.WriteLine("")
        Console.WriteLine("Billing started")
        Console.WriteLine("")

        Console.WriteLine("choose vanilla, chocolate or strawberry")

        Do Until choice = 0

            choice = Console.ReadLine()


            Select Case choice
                Case 1
                    totalcost = totalcost + 5
                    Console.WriteLine("total cost = $" & totalcost)
                Case 2
                    totalcost = totalcost + 4
                    Console.WriteLine("total cost = $" & totalcost)
                Case 3
                    totalcost = totalcost + 3
                    Console.WriteLine("total cost = $" & totalcost)
                Case Else
                    Console.WriteLine("enter correct flavour")
            End Select

            Console.WriteLine("")
            Console.WriteLine("just another flavour to add to the bill or enter 0 to finish")

        Loop

        Console.WriteLine("")
        Console.WriteLine("enter the amount received from buyer")

        Do Until amountcheck = True
            amountreceived = Console.ReadLine()
            If totalcost <= amountreceived Then
                amountcheck = True
            Else
                Console.WriteLine("ask for more money and re enter the total amount")
            End If

        Loop

        change = changecalculation(amountreceived, totalcost)
        Console.WriteLine("")
        Console.WriteLine("change = $" & change & ".")


        Console.ReadLine()
    End Sub

End Module