<%@ Page Title="View Timetable" Language="C#" MasterPageFile="~/Timetable.Master" AutoEventWireup="true" CodeBehind="ViewTimetable.aspx.cs" Inherits="Timetable_app.ViewTimetable" Async="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br /><br />
    <div class="text-center text-capitalize">
        <h4>Time Table</h4>
    </div>
    <asp:GridView ID="Subject_Table" runat="server" AutoGenerateColumns="False" DataKeyNames="GenKey" DataSourceID="GenTableSource" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="table table-hover table-responsive">
        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="GenKey" HeaderText="GenKey" SortExpression="GenKey" InsertVisible="False" ReadOnly="True" Visible="false"></asp:BoundField>
            <asp:BoundField DataField="Days" HeaderText="Days" SortExpression="Days"></asp:BoundField>
            <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject"></asp:BoundField>
            <asp:BoundField DataField="Teacher" HeaderText="Teacher" SortExpression="Teacher"></asp:BoundField>
            <asp:BoundField DataField="Venue" HeaderText="Venue" SortExpression="Venue"></asp:BoundField>
            <asp:BoundField DataField="Start_Time" HeaderText="Start Time" SortExpression="Start_Time"></asp:BoundField>
            <asp:BoundField DataField="End_Time" HeaderText="End Time" SortExpression="End_Time"></asp:BoundField>

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
    <asp:SqlDataSource runat="server" ID="GenTableSource" ConnectionString='<%$ ConnectionStrings:TimetableDBConnectionString %>' SelectCommand="SELECT * FROM [GenTimetables] ORDER BY [GenKey]"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="TableDataSource" ConnectionString='<%$ ConnectionStrings:TimetableDBConnectionString %>' SelectCommand="SELECT [Subject], [Teacher], [Venue], [Duration_HR], [TPW], [ID] FROM [TimetableDBs] ORDER BY [ID]" DeleteCommand="DELETE FROM TimetableDBs WHERE [ID] = @ID" UpdateCommand="UPDATE TimetableDBs SET Teacher =@Teacher, Subject =@Subject, Venue =@Venue, Duration_HR = @Duration_HR, TPW = @TPW WHERE ID = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID"></asp:Parameter>
        </DeleteParameters>
    </asp:SqlDataSource>
    <br />
    
</asp:Content>
