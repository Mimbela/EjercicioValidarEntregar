<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="EjercicioValidarEntregar.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Nombre de Usuario<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                runat="server" 
                ControlToValidate="TextBox1"
                Display="Dynamic"
                Text="*"
                ErrorMessage="Debes poner tu nombre">

            </asp:RequiredFieldValidator>
            <br />

            Edad <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                runat="server" 
                 ControlToValidate="TextBox2"
                Text="*"
                Display="Dynamic"
               ErrorMessage="Debes introducir tu edad">

            </asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" 
                runat="server" 
                ControlToValidate="TextBox2"
                Type="Integer"
                MinimumValue="18"
                MaximumValue="50"
                ErrorMessage="Debes tener edad entre 18-50 años">

            </asp:RangeValidator>

            <br />

            Password <asp:TextBox ID="TextBox3" TextMode="Password" runat ="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                runat="server" 
                ControlToValidate="TextBox3"
                Display="Dynamic"
                Text="*"
                
                ErrorMessage="Introduce una contraseña.">
            </asp:RequiredFieldValidator>

            <asp:CustomValidator ID="CustomValidator1" 
                runat="server" 
                ControlToValidate="TextBox3"
                
               OnServerValidate="CustomValidator1_ServerValidate"
               
                ErrorMessage="Pon una contraseña de más de 4 caracteres">

            </asp:CustomValidator>
           <%-- si lo queremos validar desde el cliente:
             debemos poner :clientvalidationfunction = "comprobarlongitud"
               desde el servidorsería onservervalidate.
               luego debemos poner el siguiente  script en el cliente:
            <script type="text/javascript">
                function Comprobarlongitud(fuente, args) {
                    args.isValida= args.value.length>=4
                }
            </script>--%>
             <br />

            Confirmar Password <asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                runat="server" 
                 ControlToValidate="TextBox4"
                ErrorMessage="RequiredFieldValidator">

            </asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" 
                ControlToValidate="TextBox4"
                ControlToCompare="TextBox3"
                runat="server" 
                ErrorMessage="No coinciden las passwords">

            </asp:CompareValidator>

        <%--si hacemos la comparación desde el cliente debemos añadir lo siguiente    
            controltovalidate=txtconfirPass
            controltoconpare=txtpass--%>
            
            <br />

            <asp:Button ID="Button1" runat="server" Text="ACEPTAR" />

            <br />

            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />



        </div>
    </form>
</body>
</html>
<%--Ejercicio propuesto(4.3):
Crear un formulario web con los siguientes datos:
Nombre Usuario(Requerido)
Edad(Requerido  rango : 18-50)
Password (requeridos mas de 4 caracteres)
Confirmar Password (debe coincidir con la anterior)
Botón de Envío.
Realizar las validaciones mostrando un resumen de errores al clic del botón.--%>
