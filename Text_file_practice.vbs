'Reading and writing from a text file
Module Module1

    Sub Main()
        Dim line As String
        Dim filehandle As IO.StreamReader

        filehandle = New IO.StreamReader("C:\Users\COM312\Documents\Visual Studio 2008\Projects\devansh\devansh\bin\Debug\mymusic.txt")

        Do Until filehandle.endofstream
            line = filehandle.ReadLine()
            Console.WriteLine(line)
        Loop
        filehandle.Close()
        Console.ReadLine()
    End Sub

End Module



'Creating and writing to a text file
Module Module1

    Sub Main()
        Dim cdtitle, cdlocation, cdartist As String
        Dim filehandle As IO.StreamWriter

        filehandle = New IO.StreamWriter("mymusic.txt")

        Console.WriteLine("enter the cd title")
        cdtitle = Console.ReadLine()

        While cdtitle <> "end"
            Console.WriteLine("enter the cd artist")
            cdartist = Console.ReadLine()
            Console.WriteLine("enter the cd location")
            cdlocation = Console.ReadLine()

            filehandle.WriteLine(cdtitle & " : " & cdartist & " : " & cdlocation)
            filehandle.WriteLine("")
            Console.WriteLine("enter end in the cd title to stop entering music")
            Console.WriteLine("enter the cd title")
            cdtitle = Console.ReadLine()
        End While
        filehandle.Close()
    End Sub

End Module



'A random question (text files)
Module Module1


    Sub Makenewfile()
        Dim filehandle As IO.StreamWriter
        Dim filehandle2 As IO.StreamReader
        Dim newline, line As String

        filehandle = New IO.StreamWriter("newemaildetails.txt")
        filehandle2 = New IO.StreamReader("C:\Users\COM312\Documents\Visual Studio 2008\Projects\records\records\bin\Debug\emaildetails.txt")

        Do Until filehandle2.EndOfStream
            line = filehandle2.ReadLine()
            newline = "00" + line
            filehandle.WriteLine(newline)

        Loop

        filehandle.Close()
        filehandle2.Close()

    End Sub
    Sub main()
        Makenewfile()
    End Sub

End Module