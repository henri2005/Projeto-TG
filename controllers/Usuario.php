<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Usuario extends CI_Controller{
    private $idUsuario;
    private $nome;
    private $usuario;
    private $senha;
    private $estatus;
    private $tipoTurismo;

    public function getIdUsuario(){
        return $this->idUsuario;
    }
    public function getNome(){
        return $this->nome;
    }
    public function getUsuario(){
        return $this->usuario;
    }
    public function getSenha(){
        return $this->senha;
    }
    public function getEstatus(){
        return $this->estatus;
    }
    public function getTipoTurismo(){
        return $this->tipoTurismo;
    }

    //setters
    public function setIdUsuario($idUsuarioFront){
        $this->idUsuario = $idUsuarioFront;
    }
    public function setNome($nomeFront){
        $this->nome = $nomeFront;
    }
    public function setUsuario($usuarioFront){
        $this->usuario = $usuarioFront;
    }
    public function setSenha($senhaFront){
        $this->senha = $senhaFront;
    }
    public function setEstatus($estatusFront){
        $this->estatus = $estatusFront;
    }
    public function setTipoTurismo($tipoTurismoFront){
        $this->tipoTurismo = $tipoTurismoFront;
    }

    public function inserir(){
        try{
            $json = file_get_contents('php://input');
            $resultado = json_decode($json);

            $lista = array(
                "nome" => '0',
                "usuario" => '0',
                "senha" => '0',
                "tipoTurismo" => '0'
            );

            if (verificarParam($resultado, $lista) == 1) {
                //fazendo os setters
                $this->setNome($resultado->nome);
                $this->setUsuario($resultado->usuario);
                $this->setSenha($resultado->senha);
                $this->setTipoTurismo($resultado->tipoTurismo);

                if (trim($this->getNome()) == '') {
                    $retorno = array(
                        'codigo' => 2,
                        'msg' => 'Nome não informado.'
                    );
                } elseif (trim($this->getUsuario()) == '') {
                    $retorno = array(
                        'codigo' => 3,
                        'msg' => 'Usuário não informado.'
                    );
                } elseif (trim($this->getSenha()) == '') {
                    $retorno = array(
                        'codigo' => 4,
                        'msg' => 'Senha não informada.'
                    );
                } elseif (trim($this->getTipoTurismo()) == ''){
                    $retorno = array(
                        'codigo' => 5,
                        'msg' => 'É necessário informar seu tipo de turismo!'
                    );
                } else{
                    $this->load->model('M_usuario');

                    $retorno = $this->M_usuario->inserir($this->getNome(), $this->getUsuario(), $this->getSenha(), $this->getTipoTurismo());
                }
            } else{
                $retorno = array(
                    'codigo' => 99,
                    "msg" => "Os campos de front-end não correspondem ao método de inserção"
                );
            }
        } catch (Exception $e) {
            $retorno = array(
                'codigo' => 0,
                "msg" => "ATENÇÃO! O seguinte erro ocorreu!", $e->getMessage()
            );
        }

        echo json_encode($retorno);
    }

    public function consultar(){
        try{$json = file_get_contents('php://input');
            $resultado = json_decode($json);

            $lista = array(
                "nome" => '0',
                "usuario" => '0',
                "tipoTurismo" => '0',
                "estatus" => '0'
            );

            if (verificarParam($resultado, $lista) == 1) {
                //fazendo os setters
                $this->setNome($resultado->nome);
                $this->setUsuario($resultado->usuario);
                $this->setTipoTurismo($resultado->tipoTurismo);
                $this->setEstatus($resultado->estatus);    
                
                $this->load->model('M_usuario');

                $retorno = $this->M_usuario->consultar($this->getNome(), $this->getEmail(), $this->getUsuario());
            } else{
                $retorno = array(
                    'codigo' => 99,
                    "msg" => "Os campos de front-end não correspondem ao método de inserção"
                );
            }
        } catch (Exception $e) {
            $retorno = array(
                'codigo' => 0,
                "msg" => "ATENÇÃO! O seguinte erro ocorreu!", $e->getMessage()
            );
        }

        echo json_encode($retorno);
    }

    public function alterar(){
        try{
            $json = file_get_contents('php://input');
            $resultado = json_decode($json);

            $lista = array(
                "idUsuario" => '0',
                "nome" => '0',
                "email" => '0',
                "usuario" => '0',
            );

            if (verificarParam($resultado, $lista) == 1) {
                //fazendo os setters
                $this->setIdUsuario($resultado->idUsuario);
                $this->setNome($resultado->nome);
                $this->setEmail($resultado->email);
                $this->setUsuario($resultado->usuario);

                if (trim($this->getIdUsuario()) == '') {
                    $retorno = array(
                        'codigo' => 2,
                        'msg' => 'ID do usuário não informado'
                    );
                } elseif (trim($this->getNome()) == '' && trim($this->getSenha()) == '' && trim($this->getEmail()) == '') {
                    $retorno = array(
                        'codigo' => 3,
                        'msg' => 'Pelo menos um dos parâmetros precisa ser passado.'
                    );
                } elseif (!filter_var($this->getEmail(), FILTER_VALIDATE_EMAIL) && $this->getEmail() != '') {
                    $retorno = array( // se o usuário alterar o email, ele deverá permanecer nos padrões certos
                        'codigo' => 6,
                        'msg' => 'Email em formato inválido'
                    );
                } else{
                    $this->load->model('M_usuario');

                    $retorno = $this->M_usuario->alterar($this->getIdUsuario(), $this->getNome(), $this->getEmail(), $this->getUsuario());
                }
            } else{
                $retorno = array(
                    'codigo' => 99,
                    "msg" => "Os campos de front-end não correspondem ao método de inserção"
                );
            }
        } catch (Exception $e) {
            $retorno = array(
                'codigo' => 0,
                "msg" => "ATENÇÃO! O seguinte erro ocorreu!", $e->getMessage()
            );
        }

        echo json_encode($retorno);
    }

    public function desativar(){
        try{
            $json = file_get_contents('php://input');
            $resultado = json_decode($json);

            $lista = array(
                "idUsuario" => '0'
            );

            if (verificarParam($resultado, $lista) == 1) {
                $json = file_get_contents('php://input');
                $resultado = json_decode($json);

                //fazendo os setters
                $this->setIdUsuario($resultado->idUsuario);

                if (trim($this->getIdUsuario()) == '') {
                    $retorno = array(
                        'codigo' => 2,
                        'msg' => 'ID do usuário não informado'
                    );
                } else{
                    $this->load->model('M_usuario');

                    $retorno = $this->M_usuario->desativar($this->getIdUsuario());
                }
            } else{
                $retorno = array(
                    'codigo' => 99,
                    "msg" => "Os campos de front-end não correspondem ao método de inserção"
                );
            }
        } catch (Exception $e) {
            $retorno = array(
                'codigo' => 0,
                "msg" => "ATENÇÃO! O seguinte erro ocorreu!", $e->getMessage()
            );
        }

        echo json_encode($retorno);
    }

    public function logar(){
        try{
            $json = file_get_contents('php://input');
            $resultado = json_decode($json);

            $lista = array(
                "usuario" => '0',
                "senha" => '0'
            );

            if (verificarParam($resultado, $lista) == 1) {

                //fazendo os setters
                $this->setUsuario($resultado->usuario);
                $this->setSenha($resultado->senha);

                if (trim($this->getUsuario()) == '') {
                    $retorno = array(
                        'codigo' => 2,
                        'msg' => 'Usuário não informado'
                    );
                } elseif (trim($this->getSenha()) == '') {
                    $retorno = array(
                        'codigo' => 3,
                        'msg' => 'Senha não informada'
                    );
                } else{
                    $this->load->model('M_usuario');

                    $retorno = $this->M_usuario->validaLogin($this->getUsuario(), $this->getSenha());
                }
            } else{
                $retorno = array(
                    'codigo' => 99,
                    "msg" => "Os campos de front-end não correspondem ao método de inserção"
                );
            }
        } catch (Exception $e) {
            $retorno = array(
                'codigo' => 0,
                "msg" => "ATENÇÃO! O seguinte erro ocorreu!", $e->getMessage()
            );
        }

        echo json_encode($retorno);
    }
}