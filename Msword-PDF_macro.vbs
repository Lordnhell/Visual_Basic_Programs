'macro for converting all mail merged word documents to pdf format automatically

Option Explicit

Const FOLDER_SAVED As String = "<Destination Folder Path>"
Const SOURCE_FILE_PATH As String = "<Data File Path>"

Sub TestRun()
Dim MainDoc As Document, TargetDoc As Document
Dim dbPath As String
Dim recordNumber As Long, totalRecord As Long

Set MainDoc = ActiveDocument
With MainDoc.MailMerge
    
        '// if you want to specify your data, insert a WHERE clause in the SQL statement
        .OpenDataSource Name:=SOURCE_FILE_PATH, sqlstatement:="SELECT * FROM [<Worksheet Name>$]"
            
        totalRecord = .DataSource.RecordCount

        For recordNumber = 1 To totalRecord
        
            With .DataSource
                .ActiveRecord = recordNumber
                .FirstRecord = recordNumber
                .LastRecord = recordNumber
            End With
            
            .Destination = wdSendToNewDocument
            .Execute False
            
            Set TargetDoc = ActiveDocument

            TargetDoc.SaveAs2 FOLDER_SAVED & .DataSource.DataFields("Client_Name").Value & ".docx", wdFormatDocumentDefault
            TargetDoc.ExportAsFixedFormat FOLDER_SAVED & .DataSource.DataFields("Client_Name").Value & ".pdf", exportformat:=wdExportFormatPDF
            
            TargetDoc.Close False
            
            Set TargetDoc = Nothing
                    
        Next recordNumber

End With

Set MainDoc = Nothing
End Sub