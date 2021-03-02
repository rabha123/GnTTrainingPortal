<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TrainingEditControl.ascx.cs" Inherits="GnTAMRDashboard.Custom.TrainingEditControl" %>


<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>


<p style="color:red">Please provide mandatory information as required</p>
 <table>
        
            <tr>
                                            <td>

                                                                         <dx:ASPxGridView ID="EditTrainingGrd" runat="server" AutoGenerateColumns="False"
                                                                              DataSourceID="EditPendingTrainingDataSource" KeyFieldName="ID"  OnCustomErrorText="EditTrainingGrd_CustomErrorText">
                                                                    <Columns>
                                                                        <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0"></dx:GridViewCommandColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1"  Caption="Trainig ID"><EditFormSettings Visible="True" /> </dx:GridViewDataTextColumn>

                                                                    <dx:GridViewDataDateColumn FieldName="TrainingDate" VisibleIndex="2" Visible="true" ></dx:GridViewDataDateColumn>


                                                                    <dx:GridViewDataTextColumn FieldName="CourseTitle" VisibleIndex="2" Visible="true" ></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="TrainerName" VisibleIndex="3"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="Department" Caption="Department" VisibleIndex="4"></dx:GridViewDataTextColumn>
                                                                      <dx:GridViewDataTextColumn FieldName="Location" Caption="Location" VisibleIndex="5"></dx:GridViewDataTextColumn>

                                                                 <%--         <dx:GridViewDataTextColumn FieldName="TrainingStartTime" Caption="TrainingStartTime" VisibleIndex="6"></dx:GridViewDataTextColumn>--%>
                                                                       <%-- DataSourceID="dsTrainingStartTime" TextField="TIMES" ValueField="TIMES"--%>

                                                                          <dx:GridViewDataComboBoxColumn FieldName="TrainingStartTime" ShowInCustomizationForm="True" Caption="TrainingStartTime" Visible="true" VisibleIndex="6">
                                            <PropertiesComboBox >
                                                <Items>
                                                    <dx:ListEditItem Text="08:00:00" Value="08:00:00" />
<dx:ListEditItem Text="08:10:00" Value="08:10:00" />
<dx:ListEditItem Text="08:20:00" Value="08:20:00" />
<dx:ListEditItem Text="08:30:00" Value="08:30:00" />
<dx:ListEditItem Text="08:40:00" Value="08:40:00" />
<dx:ListEditItem Text="08:50:00" Value="08:50:00" />
<dx:ListEditItem Text="09:00:00" Value="09:00:00" />
<dx:ListEditItem Text="09:10:00" Value="09:10:00" />
<dx:ListEditItem Text="09:20:00" Value="09:20:00" />
<dx:ListEditItem Text="09:30:00" Value="09:30:00" />
<dx:ListEditItem Text="09:40:00" Value="09:40:00" />
<dx:ListEditItem Text="09:50:00" Value="09:50:00" />
<dx:ListEditItem Text="10:00:00" Value="10:00:00" />
<dx:ListEditItem Text="10:10:00" Value="10:10:00" />
<dx:ListEditItem Text="10:20:00" Value="10:20:00" />
<dx:ListEditItem Text="10:30:00" Value="10:30:00" />
<dx:ListEditItem Text="10:40:00" Value="10:40:00" />
<dx:ListEditItem Text="10:50:00" Value="10:50:00" />
<dx:ListEditItem Text="11:00:00" Value="11:00:00" />
<dx:ListEditItem Text="11:10:00" Value="11:10:00" />
<dx:ListEditItem Text="11:20:00" Value="11:20:00" />
<dx:ListEditItem Text="11:30:00" Value="11:30:00" />
<dx:ListEditItem Text="11:40:00" Value="11:40:00" />
<dx:ListEditItem Text="11:50:00" Value="11:50:00" />
<dx:ListEditItem Text="12:00:00" Value="12:00:00" />
<dx:ListEditItem Text="12:10:00" Value="12:10:00" />
<dx:ListEditItem Text="12:20:00" Value="12:20:00" />
<dx:ListEditItem Text="12:30:00" Value="12:30:00" />
<dx:ListEditItem Text="12:40:00" Value="12:40:00" />
<dx:ListEditItem Text="12:50:00" Value="12:50:00" />
<dx:ListEditItem Text="13:00:00" Value="13:00:00" />
<dx:ListEditItem Text="13:10:00" Value="13:10:00" />
<dx:ListEditItem Text="13:20:00" Value="13:20:00" />
<dx:ListEditItem Text="13:30:00" Value="13:30:00" />
<dx:ListEditItem Text="13:40:00" Value="13:40:00" />
<dx:ListEditItem Text="13:50:00" Value="13:50:00" />
<dx:ListEditItem Text="14:00:00" Value="14:00:00" />
<dx:ListEditItem Text="14:10:00" Value="14:10:00" />
<dx:ListEditItem Text="14:20:00" Value="14:20:00" />
<dx:ListEditItem Text="14:30:00" Value="14:30:00" />
<dx:ListEditItem Text="14:40:00" Value="14:40:00" />
<dx:ListEditItem Text="14:50:00" Value="14:50:00" />
<dx:ListEditItem Text="15:00:00" Value="15:00:00" />
<dx:ListEditItem Text="15:10:00" Value="15:10:00" />
<dx:ListEditItem Text="15:20:00" Value="15:20:00" />
<dx:ListEditItem Text="15:30:00" Value="15:30:00" />
<dx:ListEditItem Text="15:40:00" Value="15:40:00" />
<dx:ListEditItem Text="15:50:00" Value="15:50:00" />
<dx:ListEditItem Text="16:00:00" Value="16:00:00" />
<dx:ListEditItem Text="16:10:00" Value="16:10:00" />
<dx:ListEditItem Text="16:20:00" Value="16:20:00" />
<dx:ListEditItem Text="16:30:00" Value="16:30:00" />
<dx:ListEditItem Text="16:40:00" Value="16:40:00" />
<dx:ListEditItem Text="16:50:00" Value="16:50:00" />
<dx:ListEditItem Text="17:00:00" Value="17:00:00" />
<dx:ListEditItem Text="17:10:00" Value="17:10:00" />
<dx:ListEditItem Text="17:20:00" Value="17:20:00" />
<dx:ListEditItem Text="17:30:00" Value="17:30:00" />
<dx:ListEditItem Text="17:40:00" Value="17:40:00" />
<dx:ListEditItem Text="17:50:00" Value="17:50:00" />
<dx:ListEditItem Text="18:00:00" Value="18:00:00" />
<dx:ListEditItem Text="18:10:00" Value="18:10:00" />
<dx:ListEditItem Text="18:20:00" Value="18:20:00" />
<dx:ListEditItem Text="18:30:00" Value="18:30:00" />
<dx:ListEditItem Text="18:40:00" Value="18:40:00" />
<dx:ListEditItem Text="18:50:00" Value="18:50:00" />
<dx:ListEditItem Text="19:00:00" Value="19:00:00" />
<dx:ListEditItem Text="19:10:00" Value="19:10:00" />
<dx:ListEditItem Text="19:20:00" Value="19:20:00" />
<dx:ListEditItem Text="19:30:00" Value="19:30:00" />
<dx:ListEditItem Text="19:40:00" Value="19:40:00" />
<dx:ListEditItem Text="19:50:00" Value="19:50:00" />
<dx:ListEditItem Text="20:00:00" Value="20:00:00" />
<dx:ListEditItem Text="20:10:00" Value="20:10:00" />
<dx:ListEditItem Text="20:20:00" Value="20:20:00" />
<dx:ListEditItem Text="20:30:00" Value="20:30:00" />
<dx:ListEditItem Text="20:40:00" Value="20:40:00" />
<dx:ListEditItem Text="20:50:00" Value="20:50:00" />
<dx:ListEditItem Text="21:00:00" Value="21:00:00" />
<dx:ListEditItem Text="21:10:00" Value="21:10:00" />
<dx:ListEditItem Text="21:20:00" Value="21:20:00" />
<dx:ListEditItem Text="21:30:00" Value="21:30:00" />
<dx:ListEditItem Text="21:40:00" Value="21:40:00" />
<dx:ListEditItem Text="21:50:00" Value="21:50:00" />
<dx:ListEditItem Text="22:00:00" Value="22:00:00" />
<dx:ListEditItem Text="22:10:00" Value="22:10:00" />
<dx:ListEditItem Text="22:20:00" Value="22:20:00" />
<dx:ListEditItem Text="22:30:00" Value="22:30:00" />
<dx:ListEditItem Text="22:40:00" Value="22:40:00" />
<dx:ListEditItem Text="22:50:00" Value="22:50:00" />
<dx:ListEditItem Text="23:00:00" Value="23:00:00" />


                                                </Items>

                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True"></EditFormSettings>
                                            </dx:GridViewDataComboBoxColumn>



                                                                   <%--     <dx:GridViewDataTextColumn FieldName="TrainingEndTime" Caption="TrainingEndTime" VisibleIndex="7"></dx:GridViewDataTextColumn>--%>

                                                                                     <dx:GridViewDataComboBoxColumn FieldName="TrainingEndTime" ShowInCustomizationForm="True" Caption="TrainingEndTime" Visible="true" VisibleIndex="7">
                                            <PropertiesComboBox >
                                                <Items>
                                                   <dx:ListEditItem Text="08:00:00" Value="08:00:00" />
<dx:ListEditItem Text="08:10:00" Value="08:10:00" />
<dx:ListEditItem Text="08:20:00" Value="08:20:00" />
<dx:ListEditItem Text="08:30:00" Value="08:30:00" />
<dx:ListEditItem Text="08:40:00" Value="08:40:00" />
<dx:ListEditItem Text="08:50:00" Value="08:50:00" />
<dx:ListEditItem Text="09:00:00" Value="09:00:00" />
<dx:ListEditItem Text="09:10:00" Value="09:10:00" />
<dx:ListEditItem Text="09:20:00" Value="09:20:00" />
<dx:ListEditItem Text="09:30:00" Value="09:30:00" />
<dx:ListEditItem Text="09:40:00" Value="09:40:00" />
<dx:ListEditItem Text="09:50:00" Value="09:50:00" />
<dx:ListEditItem Text="10:00:00" Value="10:00:00" />
<dx:ListEditItem Text="10:10:00" Value="10:10:00" />
<dx:ListEditItem Text="10:20:00" Value="10:20:00" />
<dx:ListEditItem Text="10:30:00" Value="10:30:00" />
<dx:ListEditItem Text="10:40:00" Value="10:40:00" />
<dx:ListEditItem Text="10:50:00" Value="10:50:00" />
<dx:ListEditItem Text="11:00:00" Value="11:00:00" />
<dx:ListEditItem Text="11:10:00" Value="11:10:00" />
<dx:ListEditItem Text="11:20:00" Value="11:20:00" />
<dx:ListEditItem Text="11:30:00" Value="11:30:00" />
<dx:ListEditItem Text="11:40:00" Value="11:40:00" />
<dx:ListEditItem Text="11:50:00" Value="11:50:00" />
<dx:ListEditItem Text="12:00:00" Value="12:00:00" />
<dx:ListEditItem Text="12:10:00" Value="12:10:00" />
<dx:ListEditItem Text="12:20:00" Value="12:20:00" />
<dx:ListEditItem Text="12:30:00" Value="12:30:00" />
<dx:ListEditItem Text="12:40:00" Value="12:40:00" />
<dx:ListEditItem Text="12:50:00" Value="12:50:00" />
<dx:ListEditItem Text="13:00:00" Value="13:00:00" />
<dx:ListEditItem Text="13:10:00" Value="13:10:00" />
<dx:ListEditItem Text="13:20:00" Value="13:20:00" />
<dx:ListEditItem Text="13:30:00" Value="13:30:00" />
<dx:ListEditItem Text="13:40:00" Value="13:40:00" />
<dx:ListEditItem Text="13:50:00" Value="13:50:00" />
<dx:ListEditItem Text="14:00:00" Value="14:00:00" />
<dx:ListEditItem Text="14:10:00" Value="14:10:00" />
<dx:ListEditItem Text="14:20:00" Value="14:20:00" />
<dx:ListEditItem Text="14:30:00" Value="14:30:00" />
<dx:ListEditItem Text="14:40:00" Value="14:40:00" />
<dx:ListEditItem Text="14:50:00" Value="14:50:00" />
<dx:ListEditItem Text="15:00:00" Value="15:00:00" />
<dx:ListEditItem Text="15:10:00" Value="15:10:00" />
<dx:ListEditItem Text="15:20:00" Value="15:20:00" />
<dx:ListEditItem Text="15:30:00" Value="15:30:00" />
<dx:ListEditItem Text="15:40:00" Value="15:40:00" />
<dx:ListEditItem Text="15:50:00" Value="15:50:00" />
<dx:ListEditItem Text="16:00:00" Value="16:00:00" />
<dx:ListEditItem Text="16:10:00" Value="16:10:00" />
<dx:ListEditItem Text="16:20:00" Value="16:20:00" />
<dx:ListEditItem Text="16:30:00" Value="16:30:00" />
<dx:ListEditItem Text="16:40:00" Value="16:40:00" />
<dx:ListEditItem Text="16:50:00" Value="16:50:00" />
<dx:ListEditItem Text="17:00:00" Value="17:00:00" />
<dx:ListEditItem Text="17:10:00" Value="17:10:00" />
<dx:ListEditItem Text="17:20:00" Value="17:20:00" />
<dx:ListEditItem Text="17:30:00" Value="17:30:00" />
<dx:ListEditItem Text="17:40:00" Value="17:40:00" />
<dx:ListEditItem Text="17:50:00" Value="17:50:00" />
<dx:ListEditItem Text="18:00:00" Value="18:00:00" />
<dx:ListEditItem Text="18:10:00" Value="18:10:00" />
<dx:ListEditItem Text="18:20:00" Value="18:20:00" />
<dx:ListEditItem Text="18:30:00" Value="18:30:00" />
<dx:ListEditItem Text="18:40:00" Value="18:40:00" />
<dx:ListEditItem Text="18:50:00" Value="18:50:00" />
<dx:ListEditItem Text="19:00:00" Value="19:00:00" />
<dx:ListEditItem Text="19:10:00" Value="19:10:00" />
<dx:ListEditItem Text="19:20:00" Value="19:20:00" />
<dx:ListEditItem Text="19:30:00" Value="19:30:00" />
<dx:ListEditItem Text="19:40:00" Value="19:40:00" />
<dx:ListEditItem Text="19:50:00" Value="19:50:00" />
<dx:ListEditItem Text="20:00:00" Value="20:00:00" />
<dx:ListEditItem Text="20:10:00" Value="20:10:00" />
<dx:ListEditItem Text="20:20:00" Value="20:20:00" />
<dx:ListEditItem Text="20:30:00" Value="20:30:00" />
<dx:ListEditItem Text="20:40:00" Value="20:40:00" />
<dx:ListEditItem Text="20:50:00" Value="20:50:00" />
<dx:ListEditItem Text="21:00:00" Value="21:00:00" />
<dx:ListEditItem Text="21:10:00" Value="21:10:00" />
<dx:ListEditItem Text="21:20:00" Value="21:20:00" />
<dx:ListEditItem Text="21:30:00" Value="21:30:00" />
<dx:ListEditItem Text="21:40:00" Value="21:40:00" />
<dx:ListEditItem Text="21:50:00" Value="21:50:00" />
<dx:ListEditItem Text="22:00:00" Value="22:00:00" />
<dx:ListEditItem Text="22:10:00" Value="22:10:00" />
<dx:ListEditItem Text="22:20:00" Value="22:20:00" />
<dx:ListEditItem Text="22:30:00" Value="22:30:00" />
<dx:ListEditItem Text="22:40:00" Value="22:40:00" />
<dx:ListEditItem Text="22:50:00" Value="22:50:00" />
<dx:ListEditItem Text="23:00:00" Value="23:00:00" />


                                                </Items>
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True"></EditFormSettings>
                                            </dx:GridViewDataComboBoxColumn>



                                                                      
                                                                        



                                        </Columns>

                                                                             <SettingsPager PageSize="100"></SettingsPager>
                                                                               <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" />
                                                                             <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupPanel="True" />

                                                                             <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />

                                                                             <SettingsDetail ShowDetailRow="True" ShowDetailButtons="true" ExportMode="All"/>



                                                                         <Templates>
                                                                             <DetailRow>
                                                                                 <dx:ASPxGridView ID="grdProgressChildGrd" runat="server" AutoGenerateColumns="False" 
                                                                                                     DataSourceID="GetAttendeesByTrainingIDDataSource" KeyFieldName="ID" 
                                                                                     OnBeforePerformDataSelect="grdProgressChildGrd_BeforePerformDataSelect">

                                                                                              <TotalSummary>
                                                                                 <dx:ASPxSummaryItem SummaryType="Count" FieldName="EmployeeeNo" />
                                                                             </TotalSummary>

                                                                                                                <Columns>

                                                                                                                         <%--  <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="0"> </dx:GridViewCommandColumn>--%>
 
                                                                    <dx:GridViewDataTextColumn FieldName="ID" Caption="Attendee ID" ReadOnly="True" VisibleIndex="1" Visible="true"><EditFormSettings Visible="False" /> </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="CourseTitle" VisibleIndex="2" Visible="true" ></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="EmployeeeNo" VisibleIndex="2" Visible="true" ></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="EmployeeName" VisibleIndex="3"></dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="Designation" Caption="Designation" VisibleIndex="4"></dx:GridViewDataTextColumn>
                                                                      <dx:GridViewDataTextColumn FieldName="Department" Caption="Department" VisibleIndex="5"></dx:GridViewDataTextColumn>


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
        SelectCommand ="select a.ID,b.CourseTitle, a.EmployeeeNo,a.EmployeeName,a.Designation,a.Department from Attendees a
inner join TrainingTemplateMaster b on a.TrainingID=b.ID where b.ID=@TRAINING_MASTER_ID" >
                                                                                      <SelectParameters>
                                                                                        <asp:SessionParameter Name="TRAINING_MASTER_ID" SessionField="TRAINING_MASTER_ID" />
                                                                                    </SelectParameters>
                 </asp:SqlDataSource>

                                            </td>
                                        </tr>


            <asp:SqlDataSource ID="EditPendingTrainingDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ncerpDevConnectionString %>"
                OldValuesParameterFormatString="original_{0}" 
        SelectCommand ="select ID,TrainingDate,CourseTitle,TrainerName,Department,Location,TrainingStartTime,TrainingEndTime 
                        from TrainingTemplateMaster where TrainingStatus=1 and PlantID=@PlantID and TrainingTypeID = @TrainingTypeID order by ID" 
                UpdateCommand="


        


                if ((cast(dbo.CalculateTimeDiff(@TrainingStartTime,@TrainingEndTime) as int)) &lt; 0)
                begin
                THROW 51000, 'invalid time input', 1;
                end

                


                if isnull(@CourseTitle,'')=''
                begin
                THROW 51000, 'mandatoryerror', 1;
                end
                

                if isnull(@TrainerName,'')=''
                begin
                THROW 51000, 'mandatoryerror', 1;
                end

                

                 if isnull(@Department,'')=''
                begin
                THROW 51000, 'mandatoryerror', 1;
                end

                
                 if isnull(@Location,'')=''
                begin
                THROW 51000, 'mandatoryerror', 1;
                end



               else
                begin

                
                
                update TrainingTemplateMaster 
                        set CourseTitle=@CourseTitle , TrainerName = @TrainerName,Department=@Department,Location=@Location,
                        TrainingStartTime=@TrainingStartTime , TrainingEndTime = @TrainingEndTime , TrainingDate = @TrainingDate,
                                        timeDiff = dbo.CalculateTimeDiff(@TrainingStartTime, @TrainingEndTime)  WHERE (ID =  @original_ID)
                
                end ">
                                        <SelectParameters>
                                         <asp:SessionParameter Name="PlantID" SessionField="thisPlantID" />
                                            <asp:SessionParameter Name="TrainingTypeID" SessionField="thisTrainingTypeID" />
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
             <asp:Parameter Name="TrainingDate" Type="String"/>

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