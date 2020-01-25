Imports System.Net
Imports System.Net.Mail
Imports System.Drawing
Imports System.Configuration
Imports System.Data.SqlClient
Partial Class recovery
    Inherits System.Web.UI.Page
    Protected Sub SendEmail(sender As Object, e As EventArgs)
        Dim username As String = String.Empty
        Dim password As String = String.Empty
        Dim constr As String = ConfigurationManager.ConnectionStrings("connStr").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("SELECT FName, [Password] FROM USERS WHERE Email = @Email")
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim())
                cmd.Connection = con
                con.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    If sdr.Read() Then
                        username = sdr("FName").ToString()
                        password = sdr("Password").ToString()
                    End If
                End Using
                con.Close()
            End Using
        End Using
        If Not String.IsNullOrEmpty(password) Then
            Dim mm As New MailMessage("sender@gmail.com", txtEmail.Text.Trim)
            mm.Subject = "Password Recovery"
            mm.Body = String.Format("Hi {0},<br /><br />Your password is {1}.<br /><br />Thank You.", username, password)
            mm.IsBodyHtml = True
            Dim smtp As New SmtpClient()
            smtp.Host = "smtp.gmail.com"
            smtp.EnableSsl = True
            Dim NetworkCred As New NetworkCredential()
            NetworkCred.UserName = "sender@gmail.com"
            NetworkCred.Password = "<Password>"
            smtp.UseDefaultCredentials = True
            smtp.Credentials = NetworkCred
            smtp.Port = 587
            smtp.Send(mm)
            lblMessage.ForeColor = Color.Green
            lblMessage.Text = "Password has been sent to your email address."
        Else
            lblMessage.ForeColor = Color.Red
            lblMessage.Text = "This email address does not match our records."
        End If
    End Sub
End Class
