// src/pages/api/login.ts
import prisma from '../../lib/prisma'; 

export async function POST({ request }: { request: Request }) {
  const { nombre_usuario, clave } = await request.json();

  const usuario = await prisma.usuario.findUnique({
    where: { nombre_usuario }
  });

  if (!usuario || usuario.clave !== clave) {
    return new Response(JSON.stringify({ error: 'Credenciales incorrectas' }), { status: 401 });
  }

  // Aquí puedes agregar cookies o tokens simples
  return new Response(JSON.stringify({ mensaje: 'Login exitoso', usuario }), { status: 200 });
}
