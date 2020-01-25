Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration


Partial Class admincomment
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Dim constr As String = ConfigurationManager.ConnectionStrings("conn").ConnectionString
            Dim query As String = "SELECT name, email, comment FROM comments;"

            Using con As New SqlConnection(constr)
                Using cmd As New SqlCommand(query)
                    Using sda As New SqlDataAdapter()
                        cmd.Connection = con
                        sda.SelectCommand = cmd
                        Using ds As New DataSet()
                            sda.Fill(ds)
                            gvCustomers.DataSource = ds.Tables(0)
                            gvCustomers.DataBind()
                        End Using
                    End Using
                End Using
            End Using
        End If
    End Sub

End Class
