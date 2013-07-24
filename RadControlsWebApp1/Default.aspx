<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Name my Band!</title>
	<telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server" />
    <link href="css/white-and-blue.css" rel="stylesheet" />
  </head>
<body>

    <form id="form1" runat="server">
  <div id="wrap">
      <div id="header">
        <h1>Name my Band!</h1>
        <h2>(or give me some ideas)</h2>
      </div>
        <div id="content">
            <h2><a href="#">Please, name my band...</a></h2>
            
	<telerik:RadScriptManager ID="RadScriptManager1" runat="server">
		<Scripts>
			<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
			<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
			<asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
		</Scripts>
	</telerik:RadScriptManager>
        <telerik:RadScriptBlock runat="server"> 
            <script type="text/javascript">

                function Suggest() {
                  var ajaxManager = $find("<%= RadAjaxManager1.ClientID %>");
                  ajaxManager.ajaxRequest('Sugerir');
                };

                function getWords() {
                    var words = $telerik.findTextBox('Words').get_value();
                    var arrWords = words.split(' ');
                    return arrWords;
                };
                function nameWithThe() {
                    var words = getWords();
                    var randomnumber = Math.floor(Math.random() * words.length);
                    var Resultado = $telerik.findTextBox('Resultado');
                    Resultado.set_value('The '+ words[randomnumber]);

                };
                function nameDropThe() {
                    var words = getWords();
                    var randomnumber = Math.floor(Math.random() * words.length);
                    var RandomWords = words[randomnumber];
                    randomnumber = Math.floor(Math.random() * words.length);
                    RandomWords = RandomWords + ' ' + words[randomnumber];
                    var Resultado = $telerik.findTextBox('Resultado');
                    Resultado.set_value(RandomWords);

                };
                function nameSiamese() {
                    var words = getWords();
                    var randomnumber = Math.floor(Math.random() * words.length);
                    var RandomWords = words[randomnumber];
                    randomnumber = Math.floor(Math.random() * words.length);
                    RandomWords = RandomWords + words[randomnumber];
                    var Resultado = $telerik.findTextBox('Resultado');
                    Resultado.set_value(RandomWords);

                };


                    function Generar_Clicked(sender, args) {

                        var comboBox = $telerik.findComboBox('TipoDeNombre');
                        switch (comboBox.get_value())
                        {
                            case "theName":
                                nameWithThe();
                                break;
                            case "DropTheThe":
                                nameDropThe();
                                break;
                            case "Siamese":
                                nameSiamese();
                                break;
                        }
                        
                        
                    };

            </script>
        </telerik:RadScriptBlock>



	<telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest">
        <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="Words" LoadingPanelID="ajaxLoading" UpdatePanelRenderMode="Block" />
                        
                    </UpdatedControls>
                </telerik:AjaxSetting>
        </AjaxSettings>
        
	</telerik:RadAjaxManager>
        <telerik:RadAjaxLoadingPanel ID="ajaxLoading" runat="server"></telerik:RadAjaxLoadingPanel>
	<div>
       
        <div>
        <telerik:RadTextBox ID="Words" runat="server"  Width="100%" TextMode="MultiLine" Label="Using the following words: "> </telerik:RadTextBox>
            <telerik:RadButton ID="btnSuggest" runat="server" OnClientClicked="Suggest" Text="Suggest words, pls!" ButtonType="StandardButton" AutoPostBack="false"></telerik:RadButton> 
                </div><div>      
        
            </div><div>
        <telerik:RadComboBox ID="TipoDeNombre" runat="server" Width="100%" Label="and make it look like: ">
            <Items>
                <telerik:RadComboBoxItem Text="The (name)" Value="theName" />
                <telerik:RadComboBoxItem Text="Drop The 'The'" Value="DropTheThe" />
                <telerik:RadComboBoxItem Text="Siamese" Value="Siamese" />
            </Items>
        </telerik:RadComboBox> 
             </div><div>       
        <telerik:RadButton ID="Generar" runat="server" OnClientClicked="Generar_Clicked" Text="Name my band!" ButtonType="StandardButton" AutoPostBack="false"></telerik:RadButton> 
                </div><div>      
        <telerik:RadTextBox ID="Resultado" ReadOnly="true" runat="server" Width="600px" TextMode="MultiLine" Label="Your band will be known as... " > </telerik:RadTextBox>
        </div>
	</div>
              </div>
        <div id="divider">&raquo; <a href="#">Links</a> &raquo; <a href="#">Links</a> &raquo; <a href="#">Links</a> &raquo; <a href="#">Links</a> &raquo; <a href="#">Links</a></div>
  <div id="bottom">
          <div id="bottomleft">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Integer a libero ac ante tempus interdum. Donec non purus. Donec sed dolor. Suspendisse faucibus. Aenean a nisl non ante nonummy hendrerit. Proin lacinia malesuada ipsum. Donec magna. Quisque risus magna, consectetuer non, suscipit sit amet, interdum ac, nibh</div>
    <div id="bottomright">
      <div id="div2">Nulla facilisi. Nullam lobortis, mauris et vehicula scelerisque, urna lectus faucibus diam, vel congue enim ligula ac tortor. Suspendisse venenatis auctor tellus. Nunc arcu elit, suscipit non, semper in, accumsan eget, felis. Cras id sapien at felis vulputate ullamcorper</div>
    </div>
  </div>
        <div id="footer">Open Source Design Template sponsored by <a href="http://www.cmgtechnologies.com/">CMG Technologies</a><a href="#"></a>. </div>
</div>
	</form>
</body>
</html>
