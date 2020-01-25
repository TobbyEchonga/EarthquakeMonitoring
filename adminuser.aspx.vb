Imports System.Data
Imports System.Data.SqlClient
Imports System.Collections
Partial Class adminuser
    Inherits System.Web.UI.Page
    Private strConnString As String = ConfigurationManager.ConnectionStrings("conn").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindData()
        End If
    End Sub

    Private Sub BindData()
        Dim strQuery As String = "select usersid, fname, lname, email, status,role from users"
        Dim cmd As New SqlCommand(strQuery)
        GridView1.DataSource = GetData(cmd)
        GridView1.DataBind()
    End Sub

    Private Function GetData(ByVal cmd As SqlCommand) As DataTable
        Dim dt As New DataTable()
        Dim con As New SqlConnection(strConnString)
        Dim sda As New SqlDataAdapter()
        cmd.CommandType = CommandType.Text
        cmd.Connection = con
        con.Open()
        sda.SelectCommand = cmd
        sda.Fill(dt)
        Return dt
    End Function
    Protected Sub OnPaging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        BindData()
        GridView1.PageIndex = e.NewPageIndex
        GridView1.DataBind()
    End Sub

    Protected Sub AddNewCustomer(ByVal sender As Object, ByVal e As EventArgs)
        Dim ID As String = DirectCast(GridView1.FooterRow _
                .FindControl("txtuserID"), TextBox).Text
        Dim First As String = DirectCast(GridView1 _
                .FooterRow.FindControl("txtfname"), TextBox).Text
        Dim Last As String = DirectCast(GridView1 _
                .FooterRow.FindControl("txtlname"), TextBox).Text
        Dim Email As String = DirectCast(GridView1 _
                .FooterRow.FindControl("txtemail"), TextBox).Text
        Dim Status As String = DirectCast(GridView1 _
                .FooterRow.FindControl("txtstatus"), TextBox).Text
        Dim Role As String = DirectCast(GridView1 _
                .FooterRow.FindControl("txtrole"), TextBox).Text
        Dim con As New SqlConnection(strConnString)
        Dim cmd As New SqlCommand()
        cmd.CommandType = CommandType.Text
        cmd.CommandText = "insert into users(usersid, fname,lname,email,status,role) values(@usersid, @fname, @lname, @email, @status,@role);" &
        "select usersid, fname,lname,email,role from users"
        cmd.Parameters.Add("@usersid", SqlDbType.VarChar).Value = ID
        cmd.Parameters.Add("@fname", SqlDbType.VarChar).Value = First
        cmd.Parameters.Add("@lname", SqlDbType.VarChar).Value = Last
        cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = Email
        cmd.Parameters.Add("@status", SqlDbType.VarChar).Value = Status
        cmd.Parameters.Add("@role", SqlDbType.VarChar).Value = Role
        GridView1.DataSource = GetData(cmd)
        GridView1.DataBind()
    End Sub

    Protected Sub DeleteCustomer(ByVal sender As Object, ByVal e As EventArgs)
        Dim lnkRemove As LinkButton = DirectCast(sender, LinkButton)
        Dim con As New SqlConnection(strConnString)
        Dim cmd As New SqlCommand()
        cmd.CommandType = CommandType.Text
        cmd.CommandText = "delete from users where " &
        "usersid=@usersid;" &
        "select usersid,fname,lname,email,status,role from users"
        cmd.Parameters.Add("@usersid", SqlDbType.VarChar).Value _
            = lnkRemove.CommandArgument
        GridView1.DataSource = GetData(cmd)
        GridView1.DataBind()
    End Sub
    Protected Sub EditCustomer(ByVal sender As Object, ByVal e As GridViewEditEventArgs)
        GridView1.EditIndex = e.NewEditIndex
        BindData()
    End Sub
    Protected Sub CancelEdit(ByVal sender As Object, ByVal e As GridViewCancelEditEventArgs)
        GridView1.EditIndex = -1
        BindData()
    End Sub
    Protected Sub UpdateCustomer(ByVal sender As Object, ByVal e As GridViewUpdateEventArgs)
        Dim CustomerID As String = DirectCast(GridView1.Rows(e.RowIndex) _
                                .FindControl("lblid"), Label).Text
        Dim Name As String = DirectCast(GridView1.Rows(e.RowIndex) _
                                .FindControl("txtrole"), TextBox).Text
        Dim Status As String = DirectCast(GridView1.Rows(e.RowIndex) _
                                .FindControl("txtstatus"), TextBox).Text
        Dim con As New SqlConnection(strConnString)
        Dim cmd As New SqlCommand()
        cmd.CommandType = CommandType.Text
        cmd.CommandText = "update users set role=@role,status=@status where usersid=@usersid;" _
        & "select usersid,role,status from users"
        cmd.Parameters.Add("@usersid", SqlDbType.VarChar).Value = CustomerID
        cmd.Parameters.Add("@role", SqlDbType.VarChar).Value = Name
        cmd.Parameters.Add("@status", SqlDbType.VarChar).Value = Status
        GridView1.EditIndex = -1
        GridView1.DataSource = GetData(cmd)
        GridView1.DataBind()
    End Sub

End Class
