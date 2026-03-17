import type { Metadata } from 'next'
import './globals.css'

export const metadata: Metadata = {
  title: 'IB Score Calculator',
  description: 'Calculate your IB final grades by entering paper scores. Supports all major subjects with grade boundaries from 2019–2024.',
  keywords: ['IB', 'International Baccalaureate', 'grade calculator', 'score calculator', 'grade boundary'],
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <head>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossOrigin="anonymous" />
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@400;500;600;700;800&family=Plus+Jakarta+Sans:ital,wght@0,400;0,500;0,600;0,700;1,400&family=JetBrains+Mono:ital,wght@0,400;0,500;0,600;1,400&display=swap" rel="stylesheet" />
      </head>
      <body>{children}</body>
    </html>
  )
}
