// src/pages/api/register.ts
import prisma from '../../lib/prisma'; 


export async function POST({ request }: { request: Request }) {
  const { nombre_usuario, clave, rol } = await request.json();

  const existe = await prisma.usuario.findUnique({ where: { nombre_usuario } });

  if (existe) {
    return new Response(JSON.stringify({ error: 'Usuario ya existe' }), { status: 400 });
  }

  const nuevoUsuario = await prisma.usuario.create({
    data: {
      nombre_usuario,
      clave,
      rol
    },
  });

  return new Response(JSON.stringify(nuevoUsuario), { status: 201 });
}
