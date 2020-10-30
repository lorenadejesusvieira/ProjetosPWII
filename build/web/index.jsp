<%@page import="java.sql.*"%>
<%@page import="config.Conexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->
<!------ Include the above in your HEAD tag ---------->
<%
   Statement st = null;
   ResultSet rs = null;

%>

<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
   <!--Made with love by Mutiullah Samim -->
   
	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="styles.css">
        
        <link href="css/estilo.css" rel="stylesheet">
        
        
</head>
<body>
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>Logue-se</h3>
				<!--<div class="d-flex justify-content-end social_icon">
					<span><i class="fab fa-facebook-square"></i></span>
					<span><i class="fab fa-google-plus-square"></i></span>
					<span><i class="fab fa-twitter-square"></i></span>
				</div>-->
			</div>
			<div class="card-body">
				<form>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" name="usuario" class="form-control" placeholder="email">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" name="senha" class="form-control" placeholder="senha">
					</div>
					
					<div class="form-group">
						<input type="submit" value="Logar" class="btn float-right login_btn">
					</div>
				</form>
			</div>
                    <div class="card-footer">
			<div class="d-flex justify-content-center links">
                        <p align="center" class="text-light mt-2">
                            <%
                            String user = request.getParameter("usuario");
                            String pass = request.getParameter("senha");
                            String nomeUsuario = "";
                            String usuario = "";
                            String senha = "";
                            
                            int i = 0;
                            
                            try{
                            st = new Conexao().conectar().createStatement();
                            rs = st.executeQuery("SELECT * FROM usuarios WHERE email = '"+user+"' and senha = '"+pass+"'");
                                while(rs.next()){
                                    //out.println(rs.getString(2));
                                    usuario = rs.getString(3);
                                    senha = rs.getString(4);
                                    nomeUsuario = rs.getString(2);
                                    rs.last();
                                    i = rs.getRow();
                                }
                            
                            }
                            catch(Exception e){
                                out.println(e);
                            }
                            
                            
                             if((user == null) || (pass == null)){
                                out.println("PREENCHA OS DADOS!");
                            }
                            else{
                                if(i>0){ //user.equals(usuario) && pass.equals(senha)
                                    //out.println("LOGADO COM SUCESSO!");
                                    session.setAttribute("nomeUsuario", nomeUsuario);
                                    response.sendRedirect("restrita.jsp");
                                }
                                else{
                                    out.println("DADOS INCORRETOS!");
                                }
                            }
                            
                            %>
                        </p>
                        </div>
                    </div>
		</div>
	</div>
</div>
</body>
</html>