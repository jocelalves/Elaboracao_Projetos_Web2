<?php
// se conectar ao banco de dados
require_once __DIR__ . "/conexao.php";
// funçaõ para captuarar os dados passados de página a outra
function readdirecWith($url, $params){
if(!empty($params)){
    // separa os paramentros em espaços diferentes
$qs= http_build_query($params);
$sep = (strpos($url,'?') === false ) ? '?' :"&";
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
   if($nome === ""|| $cpf === ""|| $senha === "" || $confirmarsenha==="" ){
    $erro_validacao[] = "Preencha todos os campos";
   }
   // verificar se a senha e confirma senha são diferentes
   if($senha !== $confirmarsenha){
    $erro_validacao[] = "As senhas não conferem";
   }
   // verificar se a senha tem mais de  8 digitos
   if(strlen($senha)<8){
    $erro_validacao[] = "Senha deve ter pelo menos 8 caracteres";
   }
    // verificar o cpf pelomenos 11 digitos
   if(strlen($cpf)<11){
    $erro_validacao[] = "CPF inválido";
   }
   // agora é enviar os erros para a tela cadastro
   if($erro_validacao){
    readdirecWith("../paginas/telacadastro.html",
    ["erro"=> $erro_validacao[0]]);
   }

   // verificarse o cpf já foi cadastrado no banco de dados
   $stmt = $pdo->prepare(" SELECT * FROM cliente where CPF=cpf limit 1");
   // joga o cpf digitado dentro do banco de dados
   $stmt ->execute([':cpf =>cpf']);
   //se o cpf ja existe ele volta a tela cadastro
   if($stmt->fetch){
    readdirecWith('../paginas/telacadastro.html',["erro"=>
    ("CPF já esta cadastados")]);
   }

   /* Inserir o cliente no banco de dados */
   
   $sql = "INSERT INTO cliente (nome,cpf,telefone,email,senha)
   values (:nome,:cpf,:telefone,:email,:senha)";
   // executando o comando no banco de dados 
   $inserir = $pdo->prepare($sql)->execute([
    ":nome"=> $nome,
    ":cpf"=> $cpf,
    ":telefone"=> $telefone,
    ":email"=>$email,
    ":senha"=> $senha,
   ]); 
   /* Verificando se foi cadastrado no banco de dados */
   if($inserir){
    readdirecWith("../paginas/telacadastro.html",[
        "cadastro" => "ok"]);
}else{
    readdirecWith("../paginas/telacadastro.html",
    ["erro" => "Erro ao cadastrar no banco de dados"]);
}

}catch(PDOException $e){
  readdirecWith("../paginas/telacadastro.html",
  ["erro"=> "Erro no banco de dados:". $e->getMessage()]);
}





?>