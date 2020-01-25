Imports System.IO
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports Microsoft.VisualBasic.Devices

Partial Class adminupload
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        lblStatus.Text = ""
        My.Computer.Network.DownloadFile("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.quakeml", Server.MapPath("~/Upload/day.xml"), "", "", False, 7000000, True)
        lblStatus.Style.Add("color", "green")
        lblStatus.Text = "Download Completed"
    End Sub


    Protected Sub btn_upload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_upload.Click
        If (FileUpload1.HasFile) Then
            lbl_message.Text = ""
            Dim fileName As String = Path.GetFileName(FileUpload1.PostedFile.FileName)
            Dim filePath As String = Server.MapPath("~/Upload/day.xml") & fileName
            FileUpload1.SaveAs(filePath)
            Dim strxml As String = XDocument.Load(filePath).ToString()
            Dim constr As String = ConfigurationManager.ConnectionStrings("conn").ConnectionString
            Using con As New SqlConnection(constr)
                Using cmd As New SqlCommand("InsertXML")
                    cmd.Connection = con
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@xmlstr", strxml)
                    con.Open()
                    cmd.CommandTimeout = 50000
                    cmd.ExecuteNonQuery()
                    con.Close()
                    GridView1.DataBind()
                    lbl_message.Style.Add("color", "green")
                    lbl_message.Text = "Upload and Store successfully in quake table"
                End Using
            End Using

        Else
            lbl_message.Style.Add("color", "red")
            lbl_message.Text = "Please Choose a file to upload"

        End If
    End Sub


    Protected Sub btn_allmonth_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_allmonth.Click
        lbl_allmonth.Text = ""
        My.Computer.Network.DownloadFile("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/significant_month.quakeml", Server.MapPath("~/Upload/month.xml"), "", "", False, 7000000, True)
        lbl_allmonth.Style.Add("color", "green")
        lbl_allmonth.Text = "Download Completed"
    End Sub


    Protected Sub btn_month_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btn_month.Click
        If (FileUpload1.HasFile) Then
            lbl_message.Text = ""
            Dim fileName As String = Path.GetFileName(FileUpload1.PostedFile.FileName)
            Dim filePath As String = Server.MapPath("~/Upload/month.xml") & fileName
            FileUpload1.SaveAs(filePath)
            Dim strxml As String = XDocument.Load(filePath).ToString()
            Dim constr As String = ConfigurationManager.ConnectionStrings("conn").ConnectionString
            Using con As New SqlConnection(constr)
                Using cmd As New SqlCommand("WEEKXml")
                    cmd.Connection = con
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@xmlstr", strxml)
                    con.Open()
                    cmd.CommandTimeout = 50000
                    cmd.ExecuteNonQuery()
                    con.Close()
                    GridView2.DataBind()
                    lbl_message.Style.Add("color", "green")
                    lbl_message.Text = "Upload and Store successfully in quake table"
                End Using
            End Using

        Else
            lbl_message.Style.Add("color", "red")
            lbl_message.Text = "Please Choose a file to upload"

        End If
    End Sub




End Class

