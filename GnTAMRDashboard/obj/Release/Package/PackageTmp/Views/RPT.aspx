<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RPT.aspx.cs" Inherits="GnTAMRDashboard.Views.RPT" %>

<%@ Register Src="~/Custom/RPTControl.ascx" TagPrefix="uc1" TagName="RPTControl" %>







<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:RPTControl runat="server" id="RPTControl" />
</asp:Content>
