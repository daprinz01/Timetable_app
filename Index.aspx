<%@ Page Async="true"  Title="Set Timetable" Language="C#" MasterPageFile="~/Timetable.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Timetable_app.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-horizontal">
        <br />
        <br />
        <br />
        <h4 class="text-center">Enter details of class</h4>
        <hr />
        
        <div class="form-group">
            <label runat="server" class="col-md-2 control-label">Teacher:</label>
            <div class="col-md-6">
                <input id="Teacher" type="text" class="form-control" runat="server" />
            </div>
        </div>
        <div class="form-group">
            <label runat="server" class="col-md-2 control-label">Subject:</label>
            <div class="col-md-6">
                <input id="Subject" type="text" class="form-control" runat="server"/>
            </div>
        </div>
        <div class="form-group">
            <label runat="server" class="col-md-2 control-label">Venue:</label>
            <div class="col-md-6">
                <input id="Venue" type="text" class="form-control" runat="server"/>
            </div>
        </div>
        <div class="form-group">
            <label runat="server" class="col-md-2 control-label pull-left">No of times per week:</label>
            <div class="col-md-1 col-xs-4 col-sm-2">
                    <select id="Times" runat="server" class="form-control">
                        <option>00</option>
                        <option>01</option>
                        <option>02</option>
                        <option>03</option>
                        <option>04</option>
                        <option>05</option>
                    </select>
                </div>
        </div>
            <div class="form-group">
                <label runat="server" class="col-md-2 control-label pull-left">Duration:</label>
                <div class="col-md-1 col-xs-4 col-sm-2">
                    <select id="Start_Hour" runat="server" class="form-control">
                        <option>00</option>
                        <option>01</option>
                        <option>02</option>
                        <option>03</option>
                        <option>04</option>
                        <option>05</option>
                        <option>06</option>
                        <option>07</option>
                        <option>08</option>
                        <option>09</option>
                        <option>10</option>
                        <option>11</option>
                        <option>12</option>
                    </select>
                </div>
                <h4> Hours</h4>
                </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button OnClick="Add_Subject" runat="server" CssClass="btn btn-primary" text="Add Subject"/>
            </div>
        </div>
        <label id="validation_msg" runat="server"></label>
        </div>
</asp:Content>
