namespace ZuvoPetLocalHost.Models
{
    public class ChatViewModel
    {
        public List<Mensaje> Mensajes { get; set; }
        public string NombreDestinatario { get; set; }
        public int IdDestinatario { get; set; }
        public string NuevoMensaje { get; set; }
        public string FotoDestinatario { get; set; }
    }
}
