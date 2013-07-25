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
                    var randomnumber;  
                    var RandomWords;
                    randomnumber = Math.floor(Math.random() * words.length);                    
                    while (words[randomnumber].length > 5 || words[randomnumber].length < 1)
                    {
                        randomnumber = Math.floor(Math.random() * words.length);
                        
                    }
                    RandomWords = words[randomnumber];
                    randomnumber = Math.floor(Math.random() * words.length);
                    while (words[randomnumber].length > 5 || words[randomnumber].length < 1) {
                        randomnumber = Math.floor(Math.random() * words.length);
                    }
                    RandomWords = RandomWords + words[randomnumber];
                    var Resultado = $telerik.findTextBox('Resultado');
                    Resultado.set_value(RandomWords);

                };
                function NameNumber() {
                    var words = getWords();
                    var randomnumber = Math.floor(Math.random() * words.length);
                    var RandomWords = words[randomnumber];
                    randomnumber = Math.floor(Math.random() * randomnumber * 10);
                    RandomWords = RandomWords + ' ' + randomnumber.toString();
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
                            case "NameNumber":
                                NameNumber();
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
                <telerik:RadComboBoxItem Text="Name & Number" Value="NameNumber" />

            </Items>
        </telerik:RadComboBox> 
             </div><div>       
        <telerik:RadButton ID="Generar" runat="server" OnClientClicked="Generar_Clicked" Text="Name my band!" ButtonType="StandardButton" AutoPostBack="false"></telerik:RadButton> 
                </div><div>      
        <telerik:RadTextBox ID="Resultado" ReadOnly="true" runat="server" Width="100%" TextMode="MultiLine" Label="Your band will be known as... " > </telerik:RadTextBox>
        </div>
	</div>
              </div>
        <div id="divider">&raquo; <a href="http://www.namepistol.com/bands/band-names-the-8-most-famous-styles.html">Band Name Styles</a> &raquo; <a href="#">Links</a> &raquo; </div>
  <div id="bottom">
          <div id="bottomleft">Just type some random words and let me decide. If you don't seem to come up with any, click suggest for random words.  </div>
    <div id="bottomright">
      <div id="div2"> Coming features: 
          * Saving and rating names.
          * Band names with your names ((Lead Singer) & (The Band), The Acronym(ish) )
          * Only existing band names or song names word suggestion.
      </div>
    </div>
  </div>
        <div id="footer">App by Ema!</a><a href="#"></a> </div>
</div>
	</form>
</body>
</html>
