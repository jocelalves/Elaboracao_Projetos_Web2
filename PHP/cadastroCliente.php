<?php
// se conectar ao banco de dados
requeri_once __DIR__ . "/conexao.php";
// funçaõ para captuarar os dados passados de página a outra
function readdirecWith($url, $params){
if(!empty($params)){
    // separa os paramentros em espaços diferentes
$qs= http_build_query($params);
$sep = (stropos($url,'?') === false ) ?'?':"&";
$url .= $sep."". $qs;
}
// joga a url para o cabeçalho no navegador
header("location: $url");
// fecha o script
exit;
}
//capturar os dados jogados em variaveis
try{
    // se o metodo de envio for diferente do post
    if($_SERVER["REQUEST_METHOD"] !== "POST"){
        // voltar a tela de cadastro e exibir erro
        hedirecWith("../paginas/telacadastro.html",
        ["erro"=> "Metodo invalido"]);
  }
  // jogando os dados dentro de variaveis
  $nome = $_POST["nome"];
  $cpf = $_POST["cpf"];
  $senha = $_POST["senha"];
  $confirmarsenha = $_POST["confirma-senha"];
   
  //validando os campos
  //criar uma variavel para receber os erros de validação 
  $erro_validacao=[];
   if($nome === ""|| $cpf === ""|| $senha === "" $confirmarsenha"" ){
    $erros_validacao[] = "Preencha todos os campos";
   }
   // verificar se a senha e confirma senha são diferentes
   if($senha !== $confirmarsenha){
    $erro_validacao[] = "As senhas não conferem";
   }
   // verificar se a senha tem mais de  8 digitos
   if(strlen($senha)<12){
    $erro_validacao[] = "Senha deve ter pelo menos 8 caracteres";
   }
    // verificar o cpf pelomenos 11 digitos
   if(strlen($senha)<11){
    $erro_validacao[] = "CPF inválido";
   }
   // agora é enviar os erros para a tela cadastro
   if($erros_validacao){
    readdirecWith("../paginas/telacadastro.html",
    ["erro"=> urlencode($erros_validacao[0])]);
   }

   // verificarse o cpf já foi cadastrado no banco de dados
   $stmt = $pdo->prepare(" SELECT * FROM cliente where CPF=cpf limit 1");
   // joga o cpf digitado dentro do banco de dados
   $stmt ->execute([':cpf =>cpf']);
   //se o cpf ja existe ele volta a tela cadastro
   if($stmt->fetch){
    readdirecWith('../paginas/telacadastro.html',["erro"=>
    urldecode("CPF já esta cadastados")]);
   }
}




?>