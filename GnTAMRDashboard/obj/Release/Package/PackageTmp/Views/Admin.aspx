﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="GnTAMRDashboard.Views.Admin" %>

<%@ Register Src="~/Custom/AdminControl.ascx" TagPrefix="uc1" TagName="AdminControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


                 <uc1:AdminControl runat="server" id="AdminControl" />


 

   
</asp:Content>
