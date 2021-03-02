<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FDBControl.ascx.cs" Inherits="GnTAMRDashboard.Custom.FDBControl" %>


<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>



   <table>

         
       <tr>
           <td>
               Training ID
           </td>
       </tr>
       


       <tr>
           <td>
               <asp:TextBox ID="txtFDBTrainingID" runat="server" ReadOnly="true"></asp:TextBox>
           </td>
       </tr>


       <tr>
           <td>
               Attendee ID
           </td>
       </tr>
       


       <tr>
           <td>
               <asp:TextBox ID="txtAtnID" runat="server" ReadOnly="true"></asp:TextBox>
           </td>
       </tr>




        <tr>
           <td>
               Emp NO
           </td>
       </tr>
       


       <tr>
           <td>
               <asp:TextBox ID="txtEmpNo" runat="server" ReadOnly="true"></asp:TextBox>
           </td>
       </tr>





       <tr>
           <td>
         

               <asp:Panel ID="InitTemplate" runat="server" Visible="false">
                    <asp:GridView ID="FeedBackMasterGrdInitTemplate" runat="server" AutoGenerateColumns="False"   
            BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"   
            CellPadding="3" DataKeyNames="id" GridLines="Vertical"   DataSourceID="FDBDataSource">  
            <AlternatingRowStyle BackColor="#DCDCDC" />  
            <Columns>  

                <asp:BoundField HeaderText="ID" DataField="ID" />
                <asp:BoundField HeaderText="User Feedback" DataField="FeedBackMsg" />


              <%--  <asp:TemplateField HeaderText="Emloyee Name">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> --%> 

                <asp:TemplateField HeaderText="Response">  
                  <%--  <EditItemTemplate>  
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>  
                    </EditItemTemplate>--%>  
                    <ItemTemplate>  
                        <asp:DropDownList ID="ddResponseType" runat="server"    AutoPostBack="true"
                             DataTextField="ResponseType" DataValueField="ID" DataSourceID="ResponsesDataSource" Width="150">  
                        </asp:DropDownList>  
                    </ItemTemplate>  
                </asp:TemplateField>  


              
            </Columns>  
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />  <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />  
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />  <RowStyle BackColor="#EEEEEE" ForeColor="Black" />  
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />  <SortedAscendingCellStyle BackColor="#F1F1F1" />  
            <SortedAscendingHeaderStyle BackColor="#0000A9" />  <SortedDescendingCellStyle BackColor="#CAC9C9" />  <SortedDescendingHeaderStyle BackColor="#000065" />  
        </asp:GridView>  
               </asp:Panel>
                   
       

              <asp:Panel ID="EditTemplate" runat="server" Visible="false">
                   <asp:GridView ID="FeedBackMasterGrdEditTemplate" runat="server" AutoGenerateColumns="False"   
            BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"   DataKeyNames="TFRULinkID"
            CellPadding="3"  GridLines="Vertical"   DataSourceID="FDBLinkDataSource" ShowFooter="true">  
            <AlternatingRowStyle BackColor="#DCDCDC" />  
            <Columns>  

              
                <asp:BoundField HeaderText="FeedBackID" DataField="FeedBackID" Visible="true"/>
                <asp:BoundField HeaderText="User Feedback" DataField="FeedBackMsg" />


              <%--  <asp:TemplateField HeaderText="Emloyee Name">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField> --%> 

                <asp:TemplateField HeaderText="Response" >  
                  <%--  <EditItemTemplate>  
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>  
                    </EditItemTemplate>--%>  
                    <ItemTemplate>  
                        <asp:DropDownList ID="ddResponseType" runat="server"    AutoPostBack="true"  
                             DataTextField="ResponseType" DataValueField="ID" 
                            DataSourceID="ResponsesDataSource" SelectedValue='<%# Bind ("ResponseID") %>'  Width="250">  
                        </asp:DropDownList>  
                    </ItemTemplate>  
                </asp:TemplateField>  

                   <asp:BoundField HeaderText="Master ID" DataField="TFRULinkID" />
              
            </Columns>  
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />  <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />  
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />  <RowStyle BackColor="#EEEEEE" ForeColor="Black" />  
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />  <SortedAscendingCellStyle BackColor="#F1F1F1" />  
            <SortedAscendingHeaderStyle BackColor="#0000A9" />  <SortedDescendingCellStyle BackColor="#CAC9C9" />  <SortedDescendingHeaderStyle BackColor="#000065" />  
        </asp:GridView>  
              </asp:Panel>
           
           </td>
       </tr>

                                        
                                        <tr>
                                            <td>
                                                <dx:ASPxButton ID="btnFeedBackSave" runat="server" Text=" Save / Edit " OnClick="btnFeedBackSave_Click"></dx:ASPxButton>
                                            </td>
                                        </tr>

       
                                    </table>


                                                   <asp:SqlDataSource ID="FDBDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="select ID,FeedBackMsg from FeedBackTemplate where isActive=1">
                                                    
    </asp:SqlDataSource>


 <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>" 
     SelectCommand="SELECT ID,ResponseType FROM Responses where isActive=1" ID="ResponsesDataSource"></asp:SqlDataSource>



<asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>" 
     SelectCommand="GetFeedBackTemplate" ID="FDBLinkDataSource" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter Name="TraingID" SessionField="thisFDBTrainingID" />
          <asp:SessionParameter Name="AtnID" SessionField="thisFDBATNID" />
          <asp:SessionParameter Name="EmpNo" SessionField="thisFDBEMPNO" />
    </SelectParameters>
</asp:SqlDataSource>




