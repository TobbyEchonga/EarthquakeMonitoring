Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Partial Class client1
    Inherits System.Web.UI.Page

    Protected Sub btncomment_Click(sender As Object, e As EventArgs) Handles btncomment.Click
        Dim constring As String = System.Configuration.
       ConfigurationManager.ConnectionStrings("conn").ConnectionString
        Dim IsAdded As Boolean = False
        Dim query As String = "Insert Into comments (name,email,comment) Values( @name,@email,@comment)"
        Using conn As New SqlConnection(constring)
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@fname", txtname.Text)
                cmd.Parameters.AddWithValue("@email", txtemail.Text)
                cmd.Parameters.AddWithValue("@comment", txtcomm.Text)
                cmd.Connection = conn
                conn.Open()
                IsAdded = cmd.ExecuteNonQuery() > 0
                conn.Close()
            End Using
            Response.Redirect("login.aspx")
        End Using
    End Sub
End Class
