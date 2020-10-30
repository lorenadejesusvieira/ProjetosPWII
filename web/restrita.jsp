<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="config.Conexao"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>

<!DOCTYPE html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador</title>
    </head>
    <body style="background-image: url('http://getwallpapers.com/wallpaper/full/4/c/e/1498940-free-china-desktop-wallpaper-1920x1080-smartphone.jpg'); background-attachment: fixed; background-size: cover; background-repeat: no-repeat;">
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: crimson; color: black;">
            <a class="navbar-brand" href="#">Administrador</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="restrita.jsp" style="color: white;">Home <span class="sr-only">(current)</span></a>
                </li>
                <!--<li class="nav-item">
                  <a class="nav-link" href="#">Link</a>
                </li>-->
                <!--<li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Dropdown
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                  </div>
                </li>-->
                <!--<li class="nav-item">
                  <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                </li>-->
              </ul>
              <form class="form-inline my-2 my-lg-0">
                <%
                String nome = (String) session.getAttribute("nomeUsuario");
                out.println("Olá,&nbsp; <b> " + nome + "</b>!&nbsp;");
                out.println("<hr>");
                
                if (nome == null) {
                    response.sendRedirect("index.jsp");
                }
                
                %>
                
                <a href="logout.jsp">
                    <input type="button" class="btn btn-outline-dark" value="Sair" />
                </a>
              </form>
            </div>
          </nav>
                
    
    
    
    <div class="container">
        
        <div class="row mt-4 mb-4">
            <button type="button" class="btn btn-info" style="background-color: crimson; border-color: crimson; color:white; margin-left: 15px; margin-right: 5px;" data-toggle="modal" data-target="#exampleModal">Novo Usuário</button>
            <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search"
           name="txtbuscar" placeholder="Digite um nome" aria-label="Search" style="color: black; border-color: black; background-color: transparent;">
            <button class="btn btn-outline-dark"
           type="submit">Buscar</button>
            </form>
        </div>
 
            <!--<h5 align="center" style="color: pink;">Lista de Usuários</h5>-->
            <table class="table table-hover table-bordered table-dark" style="border-color: black;"> <!-- table-borderless -->
            <thead>
            <tr>
                <th scope="col" style="color: crimson; text-align: center;">id</th>
                <th scope="col" style="color: crimson; text-align: center;">Nome</th>
                <th scope="col" style="color: crimson; text-align: center;">Email</th>
                <th scope="col" style="color: crimson; text-align: center;">Senha</th>
                <th scope="col" style="color: crimson; text-align: center;">Nível</th>
            </tr>
            </thead>
            
            <tbody>
            <%
                  Statement st = null;  
                  ResultSet rs = null;  
                  String id_usuario = "";
                  String nome_usuario = "";
                  String email_usuario = "";
                  String senha_usuario = "";
                  String nivel_usuario = "";
                    
                try{
                    st = new Conexao().conectar().createStatement();
                    rs = st.executeQuery("SELECT * FROM usuarios");
                    while(rs.next()){
                    %>
                    <tr>
                        <td style="text-align: center; color: white;"><%= rs.getString(1)%></td>
                        <td style="text-align: center; color: white;"><%= rs.getString(2)%></td>
                        <td style="text-align: center; color: white;"><%= rs.getString(3)%></td>
                        <td style="text-align: center; color: white;"><%= rs.getString(4)%></td>
                        <td style="text-align: center; color: white;"><%= rs.getString(5)%></td>
                    </tr>
                    <%
                    
                    }
                    
                }
                catch(Exception e){
                    out.println(e);
                }
                
                %>
           
            </tbody>
            
            </table>
        </div>
                
    </body>
</html>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Inserir Usuário</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
          <form id="cadastro-form" class="form" action="" method="post">
            <div class="modal-body">
                  
            <h3 class="text-center" style="color: crimson;">Cadastro de Novo Usuário</h3>
            
            <div class="form-group">
              <label for="nome" style="color: crimson;">Nome:</label><br>
              <input type="text" name="nome" id="nome" class="form-control" required>
            </div>
            
            <div class="form-group">
              <label for="email" style="color: crimson;">Email:</label><br>
              <input type="text" name="email" id="email" class="form-control" required>
            </div>
            
            <div class="form-group">
              <label for="senha" style="color: crimson;">Senha:</label><br>
              <input type="text" name="senha" id="senha" class="form-control" required>
            </div>
            
            <div class="form-group">
              <label for="exampleFormControlSelect1" style="color: crimson;">Nível:</label>
              <select name="txtNivel" id="txtNivel" class="form-control">
                  <option>Comum</option>
                  <option>Administrador</option>
              </select>
            </div>
            
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-outline-dark" data-dismiss="modal">Fechar</button>
              <button type="submit" name="btn-salvar" class="btn btn-info" style="background-color: crimson; border-color: deeppink; color:white; margin-left: 15px; margin-right: 5px;">Salvar</button>
            </div>
        
          </form> 
    </div>
  </div>
</div>

<%
    if(request.getParameter("btn-salvar") != null){
        String nome2 = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String nivel = request.getParameter("txtNivel");
        
        try{
            st = new Conexao().conectar().createStatement();
            
            rs = st.executeQuery("SELECT * FROM usuarios WHERE email = '" + email + "' ");
            while(rs.next()){
                rs.getRow();
                if(rs.getRow() > 0){
                    out.print("<script>alert('Usuário já cadastrado!');</script>");
                    return;
                }
            }
            
            st.executeUpdate("INSERT INTO usuarios (nome, email, senha, nivel)" + "VALUES ('" + nome2 + "','" + email + "','" + senha + "','" + nivel + "')");
            response.sendRedirect("restrita.jsp");
        }
        catch(Exception e){
            out.println(e);
        }
    }

%>




<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
integrity="sha384-
DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
crossorigin="anonymous"></script>
<script
src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.m
in.js" integrity="sha384-
9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
crossorigin="anonymous"></script>
<script
src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.
min.js" integrity="sha384-
w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
crossorigin="anonymous"></script>

