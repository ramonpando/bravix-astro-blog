# Bravix Blog

Blog corporativo de Bravix especializado en IA y automatización para PyMEs mexicanas.

## 🏗️ Arquitectura del Sistema

### Proyectos Separados
- **Landing Page**: `/root/Bravix_Landing` - Sitio principal bravix.com.mx
- **Blog**: `/root/bravix-blog` - Blog separado que se integra en `/blog/`

### Ventajas de la Separación
- ✅ **Aislamiento**: Si uno falla, el otro sigue funcionando
- ✅ **Mantenimiento**: Cambios independientes sin afectar el otro
- ✅ **Deploy**: Actualizaciones separadas y más seguras
- ✅ **Desarrollo**: Equipos pueden trabajar independientemente

## 🚀 Deployment

### Proceso Automático
1. **Blog Repository**: [https://github.com/ramonpando/bravix-astro-blog.git](https://github.com/ramonpando/bravix-astro-blog.git)
2. **Dokploy**: Detecta cambios automáticamente
3. **Build**: Astro build + integración con landing
4. **Serve**: Se sirve en `bravix.com.mx/blog/`

### Script de Integración
```bash
# En /root/Bravix_Landing/build-with-blog.sh
./build-with-blog.sh  # Construye ambos proyectos e integra
```

## 📁 Estructura del Blog

```
/root/bravix-blog/
├── src/
│   ├── components/
│   │   ├── Logo.astro           # Logo Bravix (150x100px)
│   │   ├── Nav.astro            # Solo theme toggle
│   │   ├── Header.astro         # Header principal
│   │   └── Footer.astro         # Footer corporativo
│   ├── content/posts/           # Artículos en Markdown
│   │   └── inteligencia-artificial-pymes-2025.md
│   ├── layouts/
│   │   └── BaseLayout.astro     # Layout base
│   ├── pages/
│   │   ├── index.astro          # Home del blog
│   │   ├── about.astro          # Sobre Bravix
│   │   └── blog/
│   │       └── [slug].astro     # Template artículos
│   └── styles/
│       └── global.css           # Estilos globales
├── public/assets/
│   └── logo.png                 # Logo Bravix (16,821 bytes)
├── scripts/
│   └── post-build.sh           # Symlinks para assets
└── astro.config.mjs            # base: '/blog'
```

## ✍️ Crear Nuevos Artículos

### 1. Crear archivo Markdown
```bash
# En src/content/posts/
touch nuevo-articulo-2025.md
```

### 2. Frontmatter requerido
```markdown
---
title: "Título del Artículo"
slug: "url-del-articulo"
description: "Descripción breve para SEO"
publishDate: "25 Dec 2024"
---

# Contenido del artículo aquí...
```

### 3. Build y Deploy
```bash
npm run build      # Construir blog
git add .
git commit -m "Add: nuevo artículo"
git push origin master  # Deploy automático
```

## 🎨 Personalización

### Logo y Branding
- **Logo**: `public/assets/logo.png` (Bravix infinito púrpura)
- **Tamaños**: Header (150x100), Home (240x160), About (200x134)
- **Links**: Logo → bravix.com.mx (sitio principal)

### Navegación
- **Simplificada**: Solo theme toggle (modo oscuro/claro)
- **Sin enlaces**: Eliminados home/about/blog (404s)
- **Foco**: Logo para navegación principal

### Estilos
- **CSS**: `src/styles/global.css`
- **Tema**: Soporte dark/light mode
- **Responsive**: Mobile-first design
- **Branding**: Colores corporativos Bravix

## 🛠️ Comandos Útiles

### Desarrollo
```bash
npm run dev         # Servidor desarrollo
npm run build       # Build producción
npm run preview     # Preview build
```

### Deploy Completo
```bash
cd /root/Bravix_Landing
./build-with-blog.sh  # Build + integración
```

### Git Workflow
```bash
git add .
git commit -m "feat: descripción del cambio

🚀 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>"
git push origin master
```

## 🔧 Configuración Técnica

### Astro Config
- **Base**: `/blog/` (importante para rutas)
- **Output**: Static
- **Content**: Colecciones de posts

### Asset Management
- **Symlinks**: Automáticos via `post-build.sh`
- **Paths**: `/blog/assets/` y `/blog/_astro/`
- **Images**: Optimización automática

### SEO
- **Meta tags**: Configurados por artículo
- **Open Graph**: Imágenes y descripciones
- **Sitemap**: Generación automática

## 📝 Mantenimiento

### Assets Eliminados
- ❌ `profile-pic.webp` (autor template)
- ❌ `logo.webp` (planeta template)
- ❌ Componente `Bio.astro`

### URLs Válidas
- ✅ `/blog/` - Home del blog
- ✅ `/blog/inteligencia-artificial-pymes-2025` - Artículo
- ✅ `/blog/assets/logo.png` - Logo

### Debugging
```bash
# Verificar build
ls -la dist/blog/assets/logo*

# Verificar symlinks
ls -la dist/blog/_astro
ls -la dist/blog/assets

# Verificar contenido
grep -r "logo" dist/blog/index.html
```

## 🎯 Próximos Pasos

1. **Nuevo artículo**: Seguir formato established
2. **SEO**: Optimizar meta descriptions
3. **Performance**: Revisar loading times
4. **Analytics**: Implementar tracking

---

**Nota**: Este sistema está optimizado para estabilidad y separación de responsabilidades. Mantener esta arquitectura para escalabilidad futura.