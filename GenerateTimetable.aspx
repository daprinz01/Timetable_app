<%@ Page Title="Generate Timetable" Language="C#" MasterPageFile="~/Timetable.Master" AutoEventWireup="true" CodeBehind="GenerateTimetable.aspx.cs" Inherits="Timetable_app.GenerateTimetable" Async="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <h4 class="text-center">View subjects and generate timetable</h4>
        <hr />
    <asp:GridView ID="Subject_Table" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="TableDataSource" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-hover table-responsive">
        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject"></asp:BoundField>
            <asp:BoundField DataField="Teacher" HeaderText="Teacher" SortExpression="Teacher"></asp:BoundField>
            <asp:BoundField DataField="Venue" HeaderText="Venue" SortExpression="Venue"></asp:BoundField>
            <asp:BoundField DataField="Duration_HR" HeaderText="Duration_HR" SortExpression="Duration_HR"></asp:BoundField>
            <asp:BoundField DataField="TPW" HeaderText="TPW" SortExpression="TPW"></asp:BoundField>
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="false"></asp:BoundField>  
            <asp:CommandField ShowEditButton="True" HeaderText="Edit Subject" ControlStyle-CssClass="btn btn-block btn-info"></asp:CommandField>
            <asp:CommandField ShowDeleteButton="True" HeaderText="Delete Subject" ControlStyle-CssClass="btn btn-block btn-info"></asp:CommandField>
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></FooterStyle>

        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="#FFCC66" ForeColor="#333333"></PagerStyle>

        <RowStyle BackColor="#FFFBD6" ForeColor="#333333"></RowStyle>

        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="TableDataSource" ConnectionString='<%$ ConnectionStrings:TimetableDBConnectionString %>' SelectCommand="SELECT [Subject], [Teacher], [Venue], [Duration_HR], [TPW], [ID] FROM [TimetableDBs] ORDER BY [ID]" DeleteCommand="DELETE FROM TimetableDBs WHERE [ID] = @ID" UpdateCommand="UPDATE TimetableDBs SET Teacher =@Teacher, Subject =@Subject, Venue =@Venue, Duration_HR = @Duration_HR, TPW = @TPW WHERE ID = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID"></asp:Parameter>
        </DeleteParameters>
    </asp:SqlDataSource>
    <br />
    <div class="text-center">
    <asp:Button ID="Generate" runat="server" Text="Generated Timetable" OnClick="Generate_Click" CssClass="btn btn-warning btn-block" />
    </div>
    <label runat="server" id="val_txt"></label>
</asp:Content>
