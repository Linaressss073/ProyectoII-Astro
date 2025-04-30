import prisma from '../../lib/prisma'; // Adjust the import path as necessary

export async function GET() {
  const usuarios = await prisma.usuario.findMany();
  return new Response(JSON.stringify(usuarios), {
    status: 200,
    headers: { 'Content-Type': 'application/json' }
  });
}
