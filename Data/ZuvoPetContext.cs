﻿using Microsoft.EntityFrameworkCore;
using System.Text.Json;
using ZuvoPetLocalHost.Models;

namespace ZuvoPetLocalHost.Data
{
    public class ZuvoPetLocalHostContext: DbContext
    {
        public ZuvoPetLocalHostContext(DbContextOptions<ZuvoPetLocalHostContext> options): base(options){}

        // 📌 Usuarios y Roles
        public DbSet<Usuario> Usuarios { get; set; }
        public DbSet<PerfilUsuario> PerfilUsuario { get; set; }
        public DbSet<VistaPerfilAdoptante> VistaPerfilAdoptante { get; set; }
        public DbSet<VistaPerfilRefugio> VistaPerfilRefugio { get; set; }

        // 📌 Adoptantes y Refugios
        public DbSet<Adoptante> Adoptantes { get; set; }
        public DbSet<Refugio> Refugios { get; set; }

        // 📌 Mascotas y Favoritos
        public DbSet<Mascota> Mascotas { get; set; }
        public DbSet<Favorito> Favoritos { get; set; }

        public DbSet<MascotaCard> MascotasFavoritas { get; set; }
        public DbSet<MascotaAdoptada> MascotasAdoptadas { get; set; }

        // 📌 Solicitudes y Historias de Éxito
        public DbSet<SolicitudAdopcion> SolicitudesAdopcion { get; set; }
        public DbSet<HistoriaExito> HistoriasExito { get; set; }
        public DbSet<LikeHistoria> LikesHistorias { get; set; }

        // 📌 Mensajes y Notificaciones
        public DbSet<Mensaje> Mensajes { get; set; }
        public DbSet<Notificacion> Notificaciones { get; set; }
    }
}
