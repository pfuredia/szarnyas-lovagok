Off-Grid Internet és Hálózati Infrastruktúra Vizsgaremek
A projekt egy komplett, több telephelyes hálózati infrastruktúra és szerverkörnyezet tervezését, megvalósítását, valamint automatizálását mutatja be olyan területek számára, ahol nem áll rendelkezésre hagyományos vezetékes internetkapcsolat (off-grid környezet).

📐 Projekt áttekintés és topológia
A hálózat 3 telephelyet fed le redundáns, biztonságos és skálázható architektúrával:

               +----------------------------------+

               |     Off-Grid Internet Forrás     |

               | (Mikrohullám / Műhold / 4G-5G)    |

               +----------------------------------+

                                |

                   +--------------------------+

                   |  Hardware Tűzfal (PC)    |

                   |  (NAT, ACL, VPN Gateway) |

                   +--------------------------+

                                |

         +----------------------+----------------------+

         |                                             |

+------------------+                        +------------------+

| Telephely 1 (HQ) |                        | Telephely 2      |

|  - 2x Router     |--- WAN / VPN Tunnel ---|  - Remote Router |

|  - 2x Switch     |                        |  - Linux Server  |

|  - Windows Server|                        |  - NAS Backup    |

+------------------+                        +------------------+

         |                                             |

         +---------------------- WAN ------------------+

                                |

                    +-----------------------+

                    | Telephely 3           |

                    |  - Remote Switch/AP   |

                    |  - IoT & Guest Wi-Fi  |

                    +-----------------------+

💡 Fő funkciók és specifikációk
Hálózati architektúra
Több telephelyes kiépítés: 3 különálló iroda/telephely közötti biztonságos WAN kapcsolat.
Címzési rendszer: Dual-stack IPv4 és IPv6 protokoll támogatás.
Redundancia: L2 és L3 redundancia az elődleges telephelyen (2 router, 2 switch failover és terheléselosztás beállítással).
VLAN szegmentáció:
VLAN 10: Belső hálózati eszközök és szerverek (Management)
VLAN 20: Okosotthon / IoT eszközök
VLAN 30: Vendég hálózat (Guest Wi-Fi)
Routing és NAT: Dynamic (OSPF) és Static routing, valamint statikus és dinamikus NAT/PAT címfordítás.
Biztonság és Hálózatkezelés
Hardveres tűzfal: Dedikált PC alapú tűzfal (pl. pfSense/OPNsense) az áramkör szélén.
Access Control Lists (ACL): Szigorú szűrés a VLAN-ok és a külső hálózatok között.
VPN: Virtuális magánhálózati elérés a belső hálózati erőforrások távoli, biztonságos eléréséhez.
Programozott konfiguráció: SSH alapú távoli felügyelet és automatizált scriptelt beállítások.
Szerverek és Szolgáltatások
Windows Server:
Active Directory Tartományi Szolgáltatások (AD DS)

Központi jelszó- és felhasználókezelés, GPO házirendek

Automatizált szoftvertelepítés a kliensgépekre
Linux Server:
Címosztás és névfeloldás: DHCP szerver vendégeknek, Statikus IP a hálózati eszközöknek, DNS

Webkiszolgáló: HTTP/HTTPS szolgáltatások

Fájl- és nyomtató megosztás (Samba/NFS)

Automatizált mentési rendszer: Archív mentések továbbítása a másodlagos telephelyen található NAS-ra

📁 GitHub Repozitórium Struktúra
.

├── docs/                 # Részletes vizsgaremek dokumentáció és leírások

├── topology/             # Topológiai tervek (Packet Tracer / GNS3 fájlok)

├── configs/              # Hálózati eszközök beállításai

│   ├── routers/          # Router konfigok (Redundancia, OSPF, ACL)

│   ├── switches/         # Switch konfigok (VLAN-ok, Trunking, L2 redundancia)

│   └── firewall/         # Hardveres tűzfal szabályrendszerek

├── servers/              # Szerver konfigurációs fájlok

│   ├── linux/            # DHCP, DNS, Apache/Nginx, Samba scriptek

│   └── windows/          # Active Directory és GPO leírások/scriptek

└── scripts/              # Automatizált mentési és SSH management scriptek

🌿 Git Branching Stratégia
A projekt fejlesztése az alábbi ágstruktúrát követi:

main - A végleges, tesztelt és bemutatásra kész állapot.

develop - Integrációs ág a meglévő funkciók összefogására.

feature/network-topology - Hálózati tervek és topológiai fájlok.

feature/routing-switching - Router és switch konfigurációk, VLAN-ok és redundancia.

feature/security-firewall - Tűzfal szabályok, ACL-ek és VPN.

feature/linux-server - Linux alapú szolgáltatások (DHCP, DNS, HTTP, Mentés).

feature/windows-server - Active Directory, GPO és szoftvertelepítés.

feature/automation-scripts - SSH alapú management és mentési szkriptek.

📝 Telepítés és Tesztelés
Topológia betöltése: Nyisd meg a topology/ mappában található Packet Tracer / GNS3 fájlt.
Eszközök konfigurálása: Töltsd be a configs/ mappában lévő router és switch beállításokat.
Szerverek indítása: Állítsd be a Linux és Windows virtuális gépeket a servers/ mappa útmutatásai szerint.
Ellenőrzés: Futtasd a tesztelési szkripteket a hálózati kapcsolatok (ping, routing, VPN) és a szerverszolgáltatások (DHCP, DNS, AD) verifikálásához.
 
