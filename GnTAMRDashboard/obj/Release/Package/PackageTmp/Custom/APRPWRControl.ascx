<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="APRPWRControl.ascx.cs" Inherits="GnTAMRDashboard.Custom.APRPWRControl" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Src="~/Custom/RPTControl.ascx" TagPrefix="uc1" TagName="RPTControl" %>




<dx:aspxpagecontrol ID="ASPxPageControl1"  ActiveTabIndex="0" runat="server"
                     ClientIDMode="AutoID"  RenderMode="Lightweight" Theme="MetropolisBlue" Width="100%"
            EnableTabScrolling="True">
            <TabPages>  
                    <dx:TabPage Text="Approval">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">

<p style="color:red">Please provide mandatory information as required</p>
 <table>
        
            <tr>
                                            <td>

                                                                         <dx:ASPxGridView ID="ApprovalTrainingGrd" runat="server" AutoGenerateColumns="False"
                                                                              DataSourceID="ApprovalTrainingDataSource" KeyFieldName="ID"  OnHtmlRowPrepared="ApprovalTrainingGrd_HtmlRowPrepared">
                                                                    <Columns>
                                                                   <%--     <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0"></dx:GridViewCommandColumn>--%>


                                                                             <dx:GridViewCommandColumn ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0"></dx:GridViewCommandColumn>

                                                                  


                                                                    <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1"  Caption="Trainig ID" ></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="TrainingDate" VisibleIndex="2" Visible="true" ReadOnly="true"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="CourseTitle" VisibleIndex="3" Visible="true" ReadOnly="true"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="TrainerName" VisibleIndex="4" ReadOnly="true"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="Department" Caption="Department" VisibleIndex="5" ReadOnly="true"></dx:GridViewDataTextColumn>
                                                                      <dx:GridViewDataTextColumn FieldName="Location" Caption="Location" VisibleIndex="6" ReadOnly="true"></dx:GridViewDataTextColumn>
                                                                     <dx:GridViewDataTextColumn FieldName="TrainingStartTime" ShowInCustomizationForm="True" Caption="TrainingStartTime" Visible="true" VisibleIndex="7" ReadOnly="true"></dx:GridViewDataTextColumn>

                                                                         <dx:GridViewDataTextColumn FieldName="TrainingType" Caption="TrainingType" VisibleIndex="9" ReadOnly="true"></dx:GridViewDataTextColumn>

                                                                        <dx:GridViewDataTextColumn FieldName="TrainingEndTime" Caption="TrainingEndTime" VisibleIndex="8"></dx:GridViewDataTextColumn>

                                                                                    

                                                                         <dx:GridViewDataTextColumn FieldName="Status" Caption="Status" VisibleIndex="10"></dx:GridViewDataTextColumn>

                                                                        <dx:GridViewDataTextColumn FieldName="PlantName" Caption="PlantName" VisibleIndex="11"></dx:GridViewDataTextColumn>
                                                                        


                                                                                  <dx:GridViewDataTextColumn Caption="Action" ShowInCustomizationForm="True" VisibleIndex="12" >
                                                                                             <DataItemTemplate>
                                                                                                 <asp:Button ID="btnApprove" runat="server"   CssClass="form_buttonC"  Text="Approve"  AutoPostBack="true"  OnClick="btnApprove_Click" />
                                                                                             </DataItemTemplate>
                                                                                             <CellStyle HorizontalAlign="Center"> </CellStyle>
                                                                            </dx:GridViewDataTextColumn>


                                                                                  <dx:GridViewDataTextColumn Caption="Action" ShowInCustomizationForm="True" VisibleIndex="13">
                                                                                             <DataItemTemplate>
                                                                                                 <asp:Button ID="btnUnApprove" runat="server"   CssClass="form_buttonC"  Text="Revert"  AutoPostBack="true"  OnClick="btnUnApprove_Click" />
                                                                                             </DataItemTemplate>
                                                                                             <CellStyle HorizontalAlign="Center"> </CellStyle>
                                                                            </dx:GridViewDataTextColumn>


                                        </Columns>

                                                                             <SettingsPager PageSize="100"></SettingsPager>
                                                                               <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                                                                             <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupPanel="True" />

                                                                             <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />

                                                                             <SettingsDetail ShowDetailRow="True" ShowDetailButtons="true" ExportMode="All"/>



                                                                         <Templates>
                                                                             <DetailRow>
                                                                                 <dx:ASPxGridView ID="grdProgressChildGrdAPR" runat="server" AutoGenerateColumns="False" 
                                                                                                     DataSourceID="GetAttendeesByTrainingIDDataSource" KeyFieldName="ID" 
                                                                                     OnBeforePerformDataSelect="grdProgressChildGrdAPR_BeforePerformDataSelect">

                                                                                              <TotalSummary>
                                                                                 <dx:ASPxSummaryItem SummaryType="Count" FieldName="EmployeeeNo" />
                                                                             </TotalSummary>

                                                                                                                <Columns>

                                                                                                                         <%--  <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="0"> </dx:GridViewCommandColumn>--%>
 
                                                                    <dx:GridViewDataTextColumn FieldName="ID" Caption="Training ID" ReadOnly="True" VisibleIndex="1" Visible="true"><EditFormSettings Visible="False" /> </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="CourseTitle" VisibleIndex="2" Visible="true" ></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="EmployeeeNo" VisibleIndex="2" Visible="true" ></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="EmployeeName" VisibleIndex="3"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="Designation" Caption="Designation" VisibleIndex="4"></dx:GridViewDataTextColumn>
                                                                      <dx:GridViewDataTextColumn FieldName="Department" Caption="Department" VisibleIndex="5"></dx:GridViewDataTextColumn>

                                                                                                                       <dx:GridViewDataTextColumn FieldName="AttendeeID" Caption="Attendee ID" VisibleIndex="6"></dx:GridViewDataTextColumn>


                                                                                                                </Columns>

                                                                                      <SettingsPager PageSize="100"></SettingsPager>
                                                                               <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                                                                             <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupPanel="True" />

                                                                                     </dx:ASPxGridView>
                                                                             </DetailRow>
                                                                         </Templates>








                                                                             </dx:ASPxGridView>


                                                
             <asp:SqlDataSource ID="GetAttendeesByTrainingIDDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
                 OldValuesParameterFormatString="original_{0}"
        SelectCommand ="select b.ID,b.CourseTitle, a.EmployeeeNo,a.EmployeeName,a.Designation,a.Department,a.ID as AttendeeID from Attendees a
inner join TrainingTemplateMaster b on a.TrainingID=b.ID where b.ID=@TRAINING_MASTER_ID_APR" >
                                                                                      <SelectParameters>
                                                                                        <asp:SessionParameter Name="TRAINING_MASTER_ID_APR" SessionField="TRAINING_MASTER_ID_APR" />
                                                                                    </SelectParameters>
                 </asp:SqlDataSource>

                                            </td>
                                        </tr>


            <asp:SqlDataSource ID="ApprovalTrainingDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
                OldValuesParameterFormatString="original_{0}" 
        SelectCommand ="GetApproveTrainingDetails" SelectCommandType="StoredProcedure" 
                UpdateCommand="update TrainingTemplateMaster 
set CourseTitle=@CourseTitle , TrainerName = @TrainerName,Department=@Department,Location=@Location,
TrainingStartTime=@TrainingStartTime , TrainingEndTime = @TrainingEndTime , 
                timeDiff = dbo.CalculateTimeDiff(@TrainingStartTime, @TrainingEndTime)  WHERE (ID =  @original_ID)">
                                        <SelectParameters>
                                         <asp:SessionParameter Name="PlantID" SessionField="thisPlantID" />
                                            <asp:SessionParameter Name="TrainingTypeID" SessionField="thisTrainingTypeID" />
                                              <asp:SessionParameter Name="RoleID" SessionField="thisRoleID" />
                                     </SelectParameters>


        <UpdateParameters>
              <asp:Parameter Name="original_ID" Type="Int64" />
            <asp:Parameter Name="DemandValue" Type="Int32"/>
            <asp:Parameter Name="CourseTitle" Type="String"/>
            <asp:Parameter Name="TrainerName" Type="String"/>
            <asp:Parameter Name="Department"  Type="String"/>
            <asp:Parameter Name="Location" Type="String"/>
            <asp:Parameter Name="TrainingStartTime" Type="String"/>
             <asp:Parameter Name="TrainingEndTime" Type="String"/>

    <%--        <asp:SessionParameter Name="DeptID" SessionField="thisDeptID" type="Int64" />
            <asp:SessionParameter Name="UserName" SessionField="thisUserName" Type="String" />--%>


        </UpdateParameters>

            </asp:SqlDataSource>


<%--            <asp:SqlDataSource ID="dsTrainingStartTime" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>" 
                SelectCommand ="TIMELIST" SelectCommandType="StoredProcedure">
                <SelectParameters>
                                        <asp:SessionParameter Name="Stime" DefaultValue="8:00" />
                                            <asp:SessionParameter Name="Etime" DefaultValue="23:00" />
                     <asp:SessionParameter Name="MINInterval" DefaultValue="10" />
                                     </SelectParameters>




</asp:SqlDataSource>--%>



                                       <%-- <asp:SqlDataSource ID="dsTrainingEndTime" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>" 
                SelectCommand ="TIMELIST" SelectCommandType="StoredProcedure">
                <SelectParameters>
                                         <asp:SessionParameter Name="Stime" DefaultValue="8:00" />
                                            <asp:SessionParameter Name="Etime" DefaultValue="23:00" />
                     <asp:SessionParameter Name="MINInterval" DefaultValue="10" />
                                     </SelectParameters>
            </asp:SqlDataSource>--%>


        </table>


</dx:ContentControl>
                         </ContentCollection>
                        </dx:TabPage>




                    <dx:TabPage Text="Report">
                     <ContentCollection>
                             <dx:ContentControl runat="server"  SupportsDisabledAttribute="True">
                                 <uc1:RPTControl runat="server" ID="RPTControl" />
                    </dx:ContentControl>
                         </ContentCollection>
                       </dx:TabPage>


                </TabPages>



    


    </dx:aspxpagecontrol>

