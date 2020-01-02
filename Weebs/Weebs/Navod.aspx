<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Navod.aspx.cs" Inherits="Navod" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link  rel="stylesheet" type="text/css" href="style.css"/>

<!DOCTYPE html>
<link  rel="stylesheet" type="text/css" href="style.css"/>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        <h1 style="color:white";>
[type=button],[type=reset],[type=submit],button{-webkit-appearance:button}button,input{overflow:visible}button,input,optgroup,select,textarea{margin:0;font-family:inherit;font-size:inherit;line-height:inherit}*,::after,::before{text-shadow:none!important;box-shadow:none!important}*,::after,::before{box-sizing:border-box}</style>
</head>
<body style="background-color:#4F7D82">
    <form id="form1" runat="server">
        <div>
            <h1 style="color:white;text-align:center;";>Návod k obsluze stránek</h1>
            <hr style="color:white";  />
            <h1 style="color:white;text-align:center;";>Čtení časopisu</h1>
            <p style="color:white;text-align:center;";>Nezaregistrovaný uživatel má možnost stažení pouze posledních tří čísel odborného časopisu Logos Polytechnikos</p>
            <p style="color:white;text-align:center;";>Pro možnost stažení jakéhokoliv čísla časopisu je za potřebí registrace. </p>
            <hr style="color:white"; />
            <h1 style="color:white;text-align:center;";>Registrace</h1>
            <p style="color:white;text-align:center;";>Registrace probíhá standardním postupem. Vaše jméno se nesmí shodovat již s existujícím uživatelem a vaše heslo </p>
            <p style="color:white;text-align:center;";>musí mít minimálně 6 znaků. Je potřeba odkliknout tlačítko uložit myší. Ukáže se vám dialogové okno a tlačítko odhlásit se.</p>
            <p style="color:white;text-align:center;";>Po úspěšné registraci se můžete přihlásit a budete automaticky přesměrováni na všechna vydání časopisu. </p>
            <p style="color:white;text-align:center;";> Pokud chcete být autorem, redaktorem, recenzentem či administrátorem, napište na e-mailovou adresu helpdesku. </p>
            <p style="color:white;text-align:center;";> Adresa je uvedena na hlavní stránce v bílém textu pod úvodním obrázkem stránek časopisu Logos Polytechnikos.</p>
              <hr style="color:white"; />
            <h1 style="color:white;text-align:center;";>Autor</h1>
            <p style="color:white;text-align:center;";>Autor může vložit článek, který musí splňovat určitá kritéria, která jsou již předem daná a domluvená</p>
            <p style="color:white;text-align:center;";> Soubor nesmí být prázdný. Poté jde článek k redaktorovi, který ho předá k recenznímu řízení.</p>
            <p style="color:white;text-align:center;";> Pokud nebude Autor spokojený s hodnocením článku, může se odvolat stížností.</p>
            <p style="color:white;text-align:center;";> Autor vidí verze svého článku. Podle verze článku může poznat, jak je na tom jeho článek.</p>
            <hr style="color:white"; />
            <h1 style="color:white;text-align:center;";>Recenzent</h1>
            <p style="color:white;text-align:center;";>Pokud je recenzentovi přiřazen článek, zobrazí se mu v tabulce v levo nahoře.</p>
            <p style="color:white;text-align:center;";> Recenzent poté vyplní recenzní formulář a ohodnotí jej (nejlepší hodnocení je 1, nejhorší je 5) </p>
            <p style="color:white;text-align:center;";> Do komentáře na první řádek musí přidat datum, kdy článek ohodnocen. Pokud nebude, redaktor nemusí hodnocení</p>
            <p style="color:white;text-align:center;";> považovat za relevantní. </p>
            <hr style="color:white"; />
            <h1 style="color:white;text-align:center;";>Redaktor </h1>
            <p style="color:white;text-align:center;";> Redaktor má možnost upravovat název článků stáhnout jej a zkontrolovat a odstranit.</p>
            <p style="color:white;text-align:center;";> Ve druhé tabulce může vidět články, které jsou přiřazené recenzentům a kterým</p>
            <p style="color:white;text-align:center;";> Pod tabulkou má možnost vybrat nepřiřazený článek a přiřadit jej dvěma recenzentům.</p>
            <p style="color:white;text-align:center;";> Musí také zadat datum, do kdy musí být články zrecenzované. </p>
            <p style="color:white;text-align:center;";>Redaktor poté stáhne zrecenzované články, které poté pošle (mimo rámec stránek) designérovi,</p>
            <p style="color:white;text-align:center;";>grafikovi, či jiné pověřené osobě, která vytvoří nové číslo časopisu. </p>
            <p style="color:white;text-align:center;";>Redaktor poté může vložit (publikovat) celé číslo časopisu. </p>
            <hr style="color:white"; />
            <h1 style="color:white;text-align:center;";>Šéfredaktor</h1>
            <p style="color:white;text-align:center;";>Šéfredaktor může sledovat veškeré dění na těchto stránkách.</p>
             <hr style="color:white"; />
            <h1 style="color:white;text-align:center;";>Administrátor</h1>
            <p style="color:white;text-align:center;";> Pouze Administrátor může odstraňovat publikovaná čísla časopisu.</p>
             <p style="color:white;text-align:center;";> Pouze Administrátor může odstraňovat/upravovat či měnit role uživatelů.
            </p>
            <hr />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click"  Text="Hlavní stránka" href="#" class="button" BackColor="#4F7D82" BorderColor="White" ForeColor="White"/>

        </div>
    </form>
</body>
</html>
