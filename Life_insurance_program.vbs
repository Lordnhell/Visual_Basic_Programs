
Module Module1
    Dim totalpoints, ans As Integer
    Function agepoints(ByVal age As Integer) As Integer
        Dim pointsofage As Integer
        If age >= 10 And age <= 20 Then
            pointsofage = pointsofage + 1
        Else
            If age >= 21 And age <= 30 Then
                pointsofage = pointsofage + 2
            Else
                If age >= 31 And age <= 40 Then
                    pointsofage = pointsofage + 3
                Else
                    If age >= 41 And age <= 50 Then
                        pointsofage = pointsofage + 4
                    Else
                        If age >= 51 And age <= 60 Then
                            pointsofage = pointsofage + 5
                        Else
                            If age >= 61 And age <= 70 Then
                                pointsofage = pointsofage + 6
                            Else
                                Console.WriteLine("enter a valid age")
                            End If
                        End If
                    End If
                End If
            End If
        End If

        Return pointsofage

    End Function
    Function genderpoints(ByVal gender As String) As Integer
        Dim pointsofgender As Integer
        If gender = "m" Or gender = "M" Then
            pointsofgender = pointsofgender + 1
        Else
            If gender = "f" Or "F" Then
                pointsofgender = pointsofgender + 2
            End If
        End If
        Return pointsofgender
    End Function
    Function diseasepoints(ByVal diseasechoice As Integer) As Integer
        Dim pointsofdisease As Integer
        Select Case diseasechoice
            Case 1
                pointsofdisease = pointsofdisease + 3
            Case 2
                pointsofdisease = pointsofdisease + 2
            Case 3
                pointsofdisease = pointsofdisease + 1
            Case 0
                pointsofdisease = pointsofdisease + 0
            Case Else
                Console.WriteLine("invalid number.")
        End Select
        Return pointsofdisease
    End Function
    Function insurancecalc(ByVal totalpoints As Integer, ByVal totalclaim As Integer) As Integer
        Dim baseprem As Integer
        baseprem = (((totalpoints - 2) / 10) + 1) * 500
        ans = (totalclaim / 100000) * baseprem

        Return ans
    End Function



    Sub Main()

        Dim name, gender As String
        Dim age, temp, diseasechoice, totalclaim, monthlyprem As Integer
        Dim filehandle As IO.StreamWriter

        Console.WriteLine("                                               LIFE INSURANCE INC.")

        Console.WriteLine("")
        Console.WriteLine("")
        Console.WriteLine("")

        Console.WriteLine("Hello there! We have created this program to make it easier for you to get a insurance premium as soon as possible!")

        Console.WriteLine("")

        Console.WriteLine("Please enter your name. (Forename-Middlename-Surname)")
        name = Console.ReadLine()

        Console.WriteLine("")

        Console.WriteLine("Please enter your gender. (M or F)")
        gender = Console.ReadLine()
        temp = genderpoints(gender)
        totalpoints = totalpoints + temp

        Console.WriteLine(" ")

        Console.WriteLine("Please enter your age (only from 10 to 70)")
        age = Console.ReadLine()
        temp = agepoints(age)
        totalpoints = totalpoints + temp

        Console.WriteLine("")

        Console.WriteLine("If you have :-")
        Console.WriteLine("Heart disease, press 1")
        Console.WriteLine("Diabetes, press 2")
        Console.WriteLine("Thyroid, press 3")
        Console.WriteLine("none of the above, press 0")
        diseasechoice = Console.ReadLine()
        temp = diseasepoints(diseasechoice)

        Console.WriteLine("Please enter the the total insurance claim ($100,000 to $1,000,000)")
        totalclaim = Console.ReadLine()

        monthlyprem = insurancecalc(totalpoints, totalclaim)
        Console.WriteLine("Your monthly premium, as calculated, is " & monthlyprem & ".")
        Console.WriteLine("")
        Console.WriteLine("Please note that any insurance claims are only applicable after a year of registeration.")
        Console.WriteLine("")
        Console.WriteLine("Thank you for using this Lifeinsurance prediction program! We'll be adding your details to our records. Have a nice day! ")

        filehandle = New IO.StreamWriter("C:\Users\USER\Documents\Visual Studio 2008\Projects\textfiles\textfiles\bin\Debug\Records.txt")
        filehandle.WriteLine(name & "   " & age & "   " & gender & "   " & totalpoints & "   " & totalclaim)
        filehandle.WriteLine("")

        filehandle.Close()

        Console.ReadLine()
    End Sub

End Module