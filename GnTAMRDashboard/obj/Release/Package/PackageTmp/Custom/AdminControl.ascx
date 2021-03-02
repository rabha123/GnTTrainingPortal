<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdminControl.ascx.cs" Inherits="GnTAMRDashboard.Custom.AdminControl" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Src="~/Custom/RPTControl.ascx" TagPrefix="uc1" TagName="RPTControl" %>
<%@ Register Src="~/Custom/APRPWRControl.ascx" TagPrefix="uc1" TagName="APRPWRControl" %>







<style type="text/css">
    .form_buttonC {background: transparent;border: 1px solid #f7941e;padding: 7px 10px;border-radius: 50px;width: 100px;color: #f7941e;font-size: 12px;}
    
    .form_textC { border:1px solid #f7941e;
	border-radius:10px;
	height: 30px;
	width: 230px;}

         .form_combo {
         width: 100%;
  padding: 16px 20px;
  border: none;
  border-radius: 4px;
  background-color: #f1f1f1;
     }



    .auto-style1 {
        height: 34px;
    }



</style>




 <dx:aspxpagecontrol ID="ASPxPageControl1"  ActiveTabIndex="1" runat="server"
                     ClientIDMode="AutoID"  RenderMode="Lightweight" Theme="MetropolisBlue" Width="100%"
            EnableTabScrolling="True">
            <TabPages>  
                    <dx:TabPage Text="Create User">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                                 <p style="color:red">Please provide mandatory information as required</p>
    <table>
        

     <tr>
        <td><h5 style="color : #f90">User Name*</h5></td>
    </tr>
    <tr>
          <td ><dx:ASPxTextBox ID="txtUserName" runat="server" CssClass="form_textC"></dx:ASPxTextBox> </td>
    </tr>



                         <tr>
        <td><h5 style="color : #f90">Required Role*</h5></td>
        </tr>


           <tr>
               <td><asp:DropDownList ID="comboRole" runat="server" DataSourceID="RoleDataSource" AutoPostBack="true" 
                                                                            DataTextField="RoleName" DataValueField="ID" ></asp:DropDownList></td>
        </tr>



         <tr>
        <td><h5 style="color : #f90">Plant*</h5></td>
    </tr>

        <tr>
               <td class="auto-style1"><asp:DropDownList ID="comboPlant" runat="server" DataSourceID="PlantRoleLinkDataSource" 
                   AutoPostBack="true" 
                                                                            DataTextField="PlantName" DataValueField="ID" ></asp:DropDownList></td>
        </tr>




  




      <tr>
        <td><h5 style="color : #f90">Training Type*</h5></td>
    </tr>

        <tr>
               <td class="auto-style1"><asp:DropDownList ID="comboTrainingType" runat="server" DataSourceID="TrainingRoleLinkDataSource" 
                   AutoPostBack="true" 
                                                                            DataTextField="TrainingType" DataValueField="ID" ></asp:DropDownList></td>
        </tr>










        <tr>
            <td></td>
        </tr>


    <tr>
        <td>  <dx:ASPxButton ID="btnCreateUser" runat="server"  CssClass="form_buttonC"  Text="Create User" OnClick="btnCreateUser_Click"  ></dx:ASPxButton></td>
    </tr>

        </table>





  
    

                  <asp:SqlDataSource ID="TrainingTypeDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="select 0 ID,'' TrainingType
    union all
SELECT ID,TrainingType FROM TrainingType 
where isActive=1 ">
    </asp:SqlDataSource>



                                                   <asp:SqlDataSource ID="TrainingRoleLinkDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="select 0 ID,'' TrainingType
union all
select c.ID,c.TrainingType from TrainingRoleLink a
inner join Roles b on a.RoleID = b.ID
inner join TrainingType c on c.ID = a.TrainingTypeID
where b.isActive=1 and c.isActive=1 and b.ID=@RoleID">
                                                       <SelectParameters>
                                                            <asp:ControlParameter ControlID="comboRole" DefaultValue="0" Name="RoleID" PropertyName="SelectedValue" />
                                                       </SelectParameters>
    </asp:SqlDataSource>




                                                                                    <asp:SqlDataSource ID="PlantRoleLinkDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="
select 0 ID,'' PlantName
union all
select c.ID,c.PlantName from PlantRoleLink a
inner join Roles b on a.RoleID = b.ID
inner join Plant c on c.ID = a.PlantID
where b.isActive=1 and c.isActive=1 and b.ID=@RoleID">
                                                       <SelectParameters>
                                                            <asp:ControlParameter ControlID="comboRole" DefaultValue="0" Name="RoleID" PropertyName="SelectedValue" />
                                                       </SelectParameters>
    </asp:SqlDataSource>





                     <asp:SqlDataSource ID="RoleDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="select 0 ID,'' RoleName
    union all
SELECT ID,RoleName FROM Roles 
where isActive=1 ">
    </asp:SqlDataSource>



                                   <asp:SqlDataSource ID="PlantDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="select 0 ID,'' PlantName
    union all
SELECT ID,PlantName FROM Plant 
where isActive=1 ">
    </asp:SqlDataSource>






                                



                             </dx:ContentControl>
                                 </ContentCollection>
                        </dx:TabPage>

             




                 <dx:TabPage Text="User Configuration">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                                    <p style="color:red">Please provide mandatory information as required</p>

                                    <table>
                                        <tr>
                                            <td>

                                                                         <dx:ASPxGridView ID="UserManagementGrd" runat="server" AutoGenerateColumns="False" DataSourceID="UserManagmentDataSource" KeyFieldName="UserID" 
                                                                             OnHtmlRowPrepared="UserManagementGrd_HtmlRowPrepared" >
                                                                    <Columns>

                                                                             <dx:GridViewCommandColumn ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0"></dx:GridViewCommandColumn>
                                                                            <dx:GridViewDataTextColumn Caption="Activate User" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                                             <DataItemTemplate>
                                                                                                 <asp:Button ID="btnActivate" runat="server"   CssClass="form_buttonC"  Text="Active"  AutoPostBack="true" OnClick="btnActivate_Click" />
                                                                                             </DataItemTemplate>
                                                                                             <CellStyle HorizontalAlign="Center"> </CellStyle>
                                                                            </dx:GridViewDataTextColumn>


                                                                    <dx:GridViewDataTextColumn Caption="Deactivate User" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                                             <DataItemTemplate>
                                                                                                 <asp:Button ID="btnDeactivate" runat="server"   CssClass="form_buttonC"  Text="InActive" AutoPostBack="true" OnClick="btnDeactivate_Click"/>
                                                                                             </DataItemTemplate>
                                                                                             <CellStyle HorizontalAlign="Center"> </CellStyle>
                                                                    </dx:GridViewDataTextColumn>



                                                                          <dx:GridViewDataTextColumn Caption="Configure User" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                                             <DataItemTemplate>
                                                                                                 <asp:Button ID="btnConfigure" runat="server"   CssClass="form_buttonC"  Text="Configure" AutoPostBack="true" OnClick="btnConfigure_Click"/>
                                                                                             </DataItemTemplate>
                                                                                             <CellStyle HorizontalAlign="Center"> </CellStyle>
                                                                    </dx:GridViewDataTextColumn>


                                                                    <dx:GridViewDataTextColumn FieldName="UserID" ReadOnly="True" VisibleIndex="1" Visible="false"><EditFormSettings Visible="False" /> </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="UserName" VisibleIndex="2" Visible="true" ></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="RoleName" VisibleIndex="2" Visible="true" ></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="PlantName" VisibleIndex="3"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="TrainingType" Caption="TrainingType" VisibleIndex="4"></dx:GridViewDataTextColumn>
                                                                      <dx:GridViewDataTextColumn FieldName="Status" Caption="Status" VisibleIndex="5"></dx:GridViewDataTextColumn>
                                        </Columns>

                                                                             <SettingsPager PageSize="100"></SettingsPager>
                                                                               <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                                                                             <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupPanel="True" />

                                                                             </dx:ASPxGridView>
                                            </td>
                                        </tr>



                                        
   


                                    </table>



                                 
                                 <%--User EDITING panel--%>
<dx:ASPxPopupControl ID="modalEditingPanel" Modal="true"   runat="server" 
                                                CloseAction="CloseButton" LoadContentViaCallback="OnFirstShow"
                          PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter" AllowDragging="True"
                             Height="100px" HeaderText="Change User Configuration" ClientInstanceName="ClientPopupControl" Width="500px" >

    <ContentCollection>
        <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                <table>
        

   <%--                  <tr>
        <td><h5 style="color : #f90">User ID*</h5></td>
    </tr>--%>
    <tr>
          <td ><dx:ASPxTextBox ID="popUserID" runat="server" CssClass="form_textC" ReadOnly="true" Visible="false"></dx:ASPxTextBox> </td>
    </tr>


     <tr>
        <td><h5 style="color : #f90">User Name*</h5></td>
    </tr>
    <tr>
          <td ><dx:ASPxTextBox ID="popUserName" runat="server" CssClass="form_textC" ReadOnly="true"></dx:ASPxTextBox> </td>
    </tr>



                         <tr>
        <td><h5 style="color : #f90">Required Role*</h5></td>
        </tr>


           <tr>
               <td><asp:DropDownList ID="popComboRole" runat="server" DataSourceID="popRoleDataSource" 
                    DataTextField="RoleName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList></td>
        </tr>



         <tr>
        <td><h5 style="color : #f90">Plant*</h5></td>
    </tr>

        <tr>
               <td class="auto-style1"><asp:DropDownList ID="popComboPlant" runat="server" DataSourceID="popPlantRoleLinkDataSource" 
                   DataTextField="PlantName" DataValueField="ID" AutoPostBack="true"></asp:DropDownList></td>
        </tr>




  




      <tr>
        <td><h5 style="color : #f90">Training Type*</h5></td>
    </tr>

        <tr>
               <td class="auto-style1"><asp:DropDownList ID="popComboTrainingType" runat="server" DataSourceID="popTrainingRoleLinkDataSource" 
                    DataTextField="TrainingType" DataValueField="ID" AutoPostBack="true"></asp:DropDownList></td>
        </tr>










        <tr>
            <td></td>
        </tr>


    <tr>
        <td>  <dx:ASPxButton ID="popBtnSave" runat="server"  CssClass="form_buttonC"  Text="Edit" OnClick="popBtnSave_Click"   ></dx:ASPxButton></td>
    </tr>

        </table>



             <asp:SqlDataSource ID="popTrainingRoleLinkDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="select 0 ID,'' TrainingType
union all
select c.ID,c.TrainingType from TrainingRoleLink a
inner join Roles b on a.RoleID = b.ID
inner join TrainingType c on c.ID = a.TrainingTypeID
where b.isActive=1 and c.isActive=1 and b.ID=@RoleID">
                                                       <SelectParameters>
                                                            <asp:ControlParameter ControlID="popComboRole" DefaultValue="0" Name="RoleID" PropertyName="SelectedValue" />
                                                       </SelectParameters>
    </asp:SqlDataSource>




                                                                                    <asp:SqlDataSource ID="popPlantRoleLinkDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="
select 0 ID,'' PlantName
union all
select c.ID,c.PlantName from PlantRoleLink a
inner join Roles b on a.RoleID = b.ID
inner join Plant c on c.ID = a.PlantID
where b.isActive=1 and c.isActive=1 and b.ID=@RoleID">
                                                       <SelectParameters>
                                                            <asp:ControlParameter ControlID="popComboRole" DefaultValue="0" Name="RoleID" PropertyName="SelectedValue" />
                                                       </SelectParameters>
    </asp:SqlDataSource>



                            <asp:SqlDataSource ID="popRoleDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="select 0 ID,'' RoleName
    union all
SELECT ID,RoleName FROM Roles 
where isActive=1 ">
    </asp:SqlDataSource>




  



          </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
<%--User EDITING panel--%>

                                                   <asp:SqlDataSource ID="UserManagmentDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="select a.ID UserID,a.UserName,b.RoleName, d.PlantName PlantName, c.TrainingType TrainingType ,
 case a.isActive  when 0 then 'In Active' else 'Active' end Status 
from Users a 
inner join Roles b on a.RoleID = b.ID
inner join TrainingType c on a.TrainingTypeID = c.ID
inner join Plant d on a.PlantID = d.ID
where  b.isActive=1 and c.isActive=1 and d.isActive=1">
                                                    
    </asp:SqlDataSource>

                             </dx:ContentControl>
                                          
                                 </ContentCollection>
                        </dx:TabPage>




           





                  <dx:TabPage Text="Approval / Report">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                              <%--   <uc1:ApprovalControl runat="server" id="ApprovalControl" />--%>
                                 <uc1:APRPWRControl runat="server" id="APRPWRControl" />
                             </dx:ContentControl> 
                                 </ContentCollection>
                        </dx:TabPage>



<%--                    <dx:TabPage Text="Report">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                                 <uc1:RPTControl runat="server" ID="RPTControl" />
                             </dx:ContentControl> 
                                 </ContentCollection>
                        </dx:TabPage>--%>




                   <%--     <dx:TabPage Text="Change User Configuration">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                               

                                 <table>
                                        <tr>
                                            <td>

                                                                         <dx:ASPxGridView ID="EditUserConfigurationGrd" runat="server" AutoGenerateColumns="False" DataSourceID="popUserManagementDataSource" KeyFieldName="UserID" >
                                                                    <Columns>

                                                                             <dx:GridViewCommandColumn ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0"></dx:GridViewCommandColumn>
                                                                            <dx:GridViewDataTextColumn Caption="Activate User" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                                             <DataItemTemplate>
                                                                                                 <asp:Button ID="btnChangeUserConfiguration" runat="server"   CssClass="form_buttonC"  Text="Change"  AutoPostBack="true" OnClick="btnChangeUserConfiguration_Click" />
                                                                                             </DataItemTemplate>
                                                                                             <CellStyle HorizontalAlign="Center"> </CellStyle>
                                                                            </dx:GridViewDataTextColumn>


                                                                

                                                                    <dx:GridViewDataTextColumn FieldName="UserID" ReadOnly="True" VisibleIndex="1" Visible="false"><EditFormSettings Visible="False" /> </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="UserName" VisibleIndex="2" Visible="true" ></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="RoleName" VisibleIndex="2" Visible="true" ></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="PlantName" VisibleIndex="3"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="TrainingType" Caption="TrainingType" VisibleIndex="4"></dx:GridViewDataTextColumn>
                                                                      <dx:GridViewDataTextColumn FieldName="Status" Caption="Status" VisibleIndex="5"></dx:GridViewDataTextColumn>
                                        </Columns>

                                                                             <SettingsPager PageSize="100"></SettingsPager>
                                                                               <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                                                                             <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupPanel="True" />

                                                                             </dx:ASPxGridView>
                                            </td>
                                        </tr>



                                        
   


                                    </table>









                                                                                       <asp:SqlDataSource ID="popUserManagementDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
        SelectCommand ="select a.ID UserID,a.UserName,b.RoleName, d.PlantName PlantName, c.TrainingType TrainingType ,
 case a.isActive  when 0 then 'In Active' else 'Active' end Status 
from Users a 
inner join Roles b on a.RoleID = b.ID
inner join TrainingType c on a.TrainingTypeID = c.ID
inner join Plant d on a.PlantID = d.ID
where  b.isActive=1 and c.isActive=1 and d.isActive=1">
                                                    
    </asp:SqlDataSource>


                             </dx:ContentControl> 
                                 </ContentCollection>
                        </dx:TabPage>--%>





                </TabPages>
            </dx:aspxpagecontrol>





 <%-- <asp:SqlDataSource ID="PlantGenerationDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>" 
        SelectCommand ="select 0 as ID , '' as Plant
UNION ALL 
select ID,Plant from Plants
where DeptID=@DeptID and  isActive In (
	case @ID when 2 then 1 else case @ID WHEN 7 THEN 1 ELSE -1 END end
)">
                                     <SelectParameters>
                                         <asp:SessionParameter Name="DeptID" SessionField="thisDeptID" />
                                          <asp:ControlParameter ControlID="DeptInRolecomboRole" DefaultValue="-1" Name="ID" PropertyName="SelectedValue" />
                                     </SelectParameters>

    </asp:SqlDataSource>--%>