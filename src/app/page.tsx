import { getServerSession } from "next-auth"
import { redirect } from "next/navigation"
import { authOptions } from "./api/auth/[...nextauth]/route"
import ClientDashboard from "./ClientDashboard"  // 👈 dashboard UI

export default async function Home() {
  // 🔐 Server-side auth check
  const session = await getServerSession(authOptions)

  if (!session) {
    redirect("/login") // 🚀 redirect if not logged in
  }

  return (
    <div className="min-h-screen bg-muted/40">
      {/* ✅ Dashboard UI */}
      <ClientDashboard />
    </div>
  )
}
