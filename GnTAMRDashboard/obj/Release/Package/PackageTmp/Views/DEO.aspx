<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DEO.aspx.cs" Inherits="GnTAMRDashboard.Views.DEO" %>

<%@ Register Src="~/Custom/DEOControl.ascx" TagPrefix="uc1" TagName="DEOControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <uc1:DEOControl runat="server" id="DEOControl" />
</asp:Content>
