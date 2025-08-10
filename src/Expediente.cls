Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Compare Database
Option Explicit

Public IDExpediente As String
Public IDExpedientePadre As String
Public Nemotecnico As String
Public Titulo As String
Public ImporteLicitacion As String
Public ImporteContratacion As String
Public CodProyecto As String
Public CodExp As String
Public CodExpLargo As String
Public CodS4H As String
Public FechaInicioContrato As String
Public FechaFinContrato As String
Public FechaFinGarantia As String
Public EsAM As String
Public EsLote As String
Public EsBasado As String
Public EsExpediente As String
Public Ordinal As String
Public IdGradoClasificacion As String
Public IDOrganoContratacion As String
Public IDOficinaPrograma As String
Public IDEjercito As String
Public AccesoSharepoint As String
Public Observaciones As String
Public FechaCreacion As String
Public IDUsuarioCreacion As String
Public FechaUltimoCambio As String
Public IDUsuarioUltimoCambio As String
Public Ambito As String
Public NPedido As String
Public IDResponsableCalidad As String
Public AGEDYSAplica As String
Public AGEDYSGenerico As String
Public HPSAplica As String
Public TIpo As String
Public CadenaPecal As String
Public PECAL As String
Public TipoInforme As String
Public POSTAGEDO As String
Public APLICAESTADO As String
Public FECHAINICIOLICITACION As String
Public FECHAPREOFERTA As String
Public FECHAOFERTA As String
Public FECHAADJUDICACION As String
Public FECHAFIRMACONTRATO As String
Public GARANTIAMESES As String
Public FECHACERTIFICACION As String
Public FECHAPERDIDA As String
Public FECHADESESTIMADA As String
Public ESTADO As String
Public CodigoActividad As String
Public AplicaTareaS4H As String
Public ContratistaPrincipal As String

' Propiedades privadas calculadas
Private m_sFechaFinGarantiaCalculada As String
Private m_sAdjudicado As String
Private m_sEnPeriodoDeAdjudicacion As String
Private m_eESTADOCalculado As EnumEstados
Private m_sESTADOCalculadoTexto As String
Private m_sESTADOCalculadoTitulo As String
Private m_sTipoParaLista As String
Private m_eTIPOEnum As EnumTipoExpediente

' Objetos relacionados
Private m_ObjExpedientePadre As Expediente
Private m_ObjExpedientePadreLote As Expediente
Private m_ObjExpedientePadreAM As Expediente
Private m_ObjGradoClasificacion As GradoClasificacion
Private m_ObjOrganoContratacion As OrganoContratacion
Private m_ObjOficinaPrograma As OficinaPrograma
Private m_ObjEjercito As Ejercito
Private m_ObjResponsableCalidad As Usuario
Private m_ObjUsuarioCreacion As Usuario
Private m_ObjUsuarioUltimoCambio As Usuario

' Propiedades de UI
Private m_sTituloFormulario As String
Private m_sUltimaModificacionTexto As String

' Colecciones de objetos relacionados
Private m_ObjExpedientesDerivados As Scripting.Dictionary
Private m_ObjLotes As Scripting.Dictionary
Private m_ObjBasados As Scripting.Dictionary
Private m_ObjDerivados As Scripting.Dictionary
Private m_ObjAnualidades As Scripting.Dictionary
Private m_ObjJefaturas As Scripting.Dictionary
Private m_ObjJuridicas As Scripting.Dictionary
Private m_ObjComerciales As Scripting.Dictionary
Private m_ObjCPVs As Scripting.Dictionary
Private m_ObjAnexos As Scripting.Dictionary
Private m_ObjLugaresEjecucion As Scripting.Dictionary
Private m_ObjPECALES As Scripting.Dictionary
Private m_ObjRACS As Scripting.Dictionary
Private m_ObjSuministradores As Scripting.Dictionary
Private m_ObjContratistas As Scripting.Dictionary
Private m_ObjSubContratistas As Scripting.Dictionary
Private m_ObjSuministradoresTotal As Scripting.Dictionary
Private m_ObjResponsablesNoJP As Scripting.Dictionary
Private m_ObjResponsablesJP As Scripting.Dictionary
Private m_ObjResponsablesConEnvioCorreo As Scripting.Dictionary
Private m_ObjResponsables As Scripting.Dictionary
Private m_ObjCodigosComprasOperaciones As Scripting.Dictionary
Private m_ObjHitos As Scripting.Dictionary

' Control de errores
Private m_objColCampos As Collection
Public Error As String
Private m_Error As String

' Ejemplo de método calculado
Public Property Get HPSAplicaTareaS4HCalculado() As String
    On Error GoTo errores
    
    Me.Error = ""
    m_Error = ""
    If InStr(1, Me.CadenaContratistas, "TSOL") = 0 Then
        m_sHPSAplicaTareaS4HCalculado = "No"
    Else
        m_sHPSAplicaTareaS4HCalculado = "Sí"
    End If
    
    HPSAplicaTareaS4HCalculado = m_sHPSAplicaTareaS4HCalculado
    Exit Property
    
errores:
    If Err.Number <> 1000 Then
        m_Error = "El método Expediente.HPSAplicaTareaS4HCalculado ha devuelto el error: " & vbNewLine & Err.Description
    End If
    Me.Error = m_Error
End Property

' TODO: Implementar patrón Repository para separar acceso a datos
' TODO: Extraer lógica de negocio a Services
' TODO: Aplicar principio de responsabilidad única