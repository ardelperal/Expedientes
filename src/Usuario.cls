Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

' Propiedades públicas del usuario
Public CorreoUsuario As String
Public Password As String
Public UsuarioRed As String
Public Nombre As String
Public Matricula As String
Public FechaAlta As String
Public Activado As Boolean
Public FechaProximoCambioContrasenia As String
Public FechaUltimaConexion As String
Public TieneQueCambiarLaContrasenia As Boolean
Public Telefono As String
Public Movil As String
Public Observaciones As String
Public UsuarioImborrable As Boolean
Public EsAdministrador As String
Public PermisosAsignados As Boolean
Public FechaBaja As String
Public PasswordNuncaCaduca As Boolean
Public MantenerLanzaderaAbierta As Boolean
Public PassIncialPlana As String
Public UsuarioSSID As String
Public Id As String
Public JefeDelUsuario As String
Public PermisoPruebas As String
Public ParaTareasProgramadas As Boolean
Public FechaBloqueo As String

' Propiedades calculadas privadas para roles
Private m_eEsAdministradorCalculado As EnumSiNo
Private m_eEsUsuarioAdministradorCalculado As EnumSiNo
Private m_eEsUsuarioCalidadCalculado As EnumSiNo
Private m_eEsUsuarioEconomiaCalculado As EnumSiNo
Private m_eEsUsuarioSecretariaCalculado As EnumSiNo
Private m_eEsUsuarioTecnicoCalculado As EnumSiNo
Private m_eEsUsuarioSinAccesoCalculado As EnumSiNo
Private m_eEsUsuarioCalidadAvisosCalculado As EnumSiNo

' Objetos relacionados
Private m_objColAplicacionesPermisos As Scripting.Dictionary
Private m_objPermisos As UsuarioAplicacionPermisos
Private m_objColCampos As Collection

' Control de errores
Public Error As String
Private m_Error As String

' Propiedades calculadas para determinar roles
Public Property Get EsAdministradorCalculado() As EnumSiNo
    On Error GoTo errores
    Me.Error = ""
    m_Error = ""
    
    If m_eEsAdministradorCalculado <> Empty Then
        EsAdministradorCalculado = m_eEsAdministradorCalculado
        Exit Property
    End If
    
    If Me.EsAdministrador = "Sí" Then
        m_eEsAdministradorCalculado = EnumSiNo.Sí
        EsAdministradorCalculado = m_eEsAdministradorCalculado
        Exit Property
    End If
    
    If Me.Permisos Is Nothing Then
        m_eEsAdministradorCalculado = EnumSiNo.No
        EsAdministradorCalculado = m_eEsAdministradorCalculado
        Exit Property
    End If
    
    m_eEsAdministradorCalculado = Me.Permisos.EsUsuarioAdministradorCalculado
    Me.Error = Me.Permisos.Error
    If Me.Error <> "" Then
        Err.Raise 1000
    End If
    
    EsAdministradorCalculado = m_eEsAdministradorCalculado
    Exit Property
    
errores:
    If Err.Number <> 1000 Then
        m_Error = "El método Usuario.EsAdministradorCalculado ha devuelto el error: " & vbNewLine & Err.Description
    End If
    Me.Error = m_Error
End Property

Public Property Get EsUsuarioTecnicoCalculado() As EnumSiNo
    On Error GoTo errores
    Me.Error = ""
    m_Error = ""
    
    If Me.Permisos Is Nothing Then
        m_eEsUsuarioTecnicoCalculado = EnumSiNo.No
        EsUsuarioTecnicoCalculado = m_eEsUsuarioTecnicoCalculado
        Exit Property
    End If
    
    m_eEsUsuarioTecnicoCalculado = Me.Permisos.EsUsuarioTecnicoCalculado
    Me.Error = Me.Permisos.Error
    If Me.Error <> "" Then
        Err.Raise 1000
    End If
    
    EsUsuarioTecnicoCalculado = m_eEsUsuarioTecnicoCalculado
    Exit Property
    
errores:
    If Err.Number <> 1000 Then
        m_Error = "El método Usuario.EsUsuarioTecnicoCalculado ha devuelto el error: " & vbNewLine & Err.Description
    End If
    Me.Error = m_Error
End Property

' TODO: Implementar UserService para lógica de autenticación
' TODO: Crear UserRepository para acceso a datos
' TODO: Separar lógica de permisos en PermissionService