Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Partial Class registration
    Inherits System.Web.UI.Page

    Protected Sub btnsave_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnsave.Click

        Dim constring As String = System.Configuration.
        ConfigurationManager.ConnectionStrings("conn").ConnectionString
        Dim IsAdded As Boolean = False
        Dim query As String = "Insert Into users (fname,lname,email,password, status, role) Values( @fname,@lname,@email,@password,'Active',1)"
        Using conn As New SqlConnection(constring)
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@fname", txtuser.Text)
                cmd.Parameters.AddWithValue("@lname", txtlname.Text)
                cmd.Parameters.AddWithValue("@email", txtemail.Text)
                cmd.Parameters.AddWithValue("@password", txtpass.Text)
                cmd.Connection = conn
                conn.Open()
                IsAdded = cmd.ExecuteNonQuery() > 0
                conn.Close()
            End Using
            Response.Redirect("login.aspx")
        End Using
    End Sub
End Class
