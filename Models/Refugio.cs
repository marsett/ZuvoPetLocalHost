﻿using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ZuvoPetLocalHost.Models
{
    [Table("REFUGIOS")]
    public class Refugio
    {
        [Key]
        [Column("Id")]
        public int Id { get; set; }

        [ForeignKey("Usuario")]
        [Column("IdUsuario")]
        public int IdUsuario { get; set; }
        public Usuario Usuario { get; set; }

        [Required, MaxLength(255)]
        [Column("NombreRefugio")]
        public string NombreRefugio { get; set; }
        [Column("ContactoRefugio")]
        public string ContactoRefugio { get; set; }
        [Column("CantidadAnimales")]
        public int CantidadAnimales { get; set; }
        [Column("CapacidadMaxima")]
        public int CapacidadMaxima { get; set; }
        [Column("Latitud")]
        public double Latitud { get; set; }

        [Column("Longitud")]
        public double Longitud { get; set; }


        // Campos adicionales para depuración (no se mapean a la base de datos)
        [NotMapped]
        public string LatitudStr { get; set; }
        [NotMapped]
        public string LongitudStr { get; set; }

        public List<Mascota> ListaMascotas { get; set; }
    }
}
