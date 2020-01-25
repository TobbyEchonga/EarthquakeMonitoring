Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Public Class login
    Inherits System.Web.UI.Page
    Private Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim conn As String
        Dim Role As Integer = 0
        conn = ConfigurationManager.ConnectionStrings("conn").ToString
        Dim con As New SqlConnection(conn)
        Dim cmd As New SqlCommand
        cmd.CommandText = "select Role from [users] where fname=@fname and password =@password and status='Active'"
        cmd.Parameters.Add("@fname", SqlDbType.NVarChar).Value = txtuser.Text
        cmd.Parameters.Add("@password", SqlDbType.NVarChar).Value = txtpass.Text
        cmd.Connection = con

        con.Open()

        Dim mystring As String = Request.Form("txtuser")
        If mystring = "" Then
            Response.Write("Please fill in the form field")
        Else
            Response.Write("Thank you for the information " & (mystring) & "<b/>")
        End If

        Role = cmd.ExecuteScalar()
        If Role = 1 Then
            Session("fname") = txtuser.Text
            Response.Redirect("~/client1.aspx")

        ElseIf Role = 2 Then
            Session("fname") = txtuser.Text
            Response.Redirect("~/admin1.aspx")
        Else
            MsgBox("Invalid username/Pasword")
        End If
        con.Close()

    End Sub

End Class
