import type { Metadata } from 'next'
import { Analytics } from '@vercel/analytics/react'
import './globals.css'

export const metadata: Metadata = {
  title: 'IB Score Calculator 2025 | Grade Boundary Calculator',
  description:
    'Free IB grade calculator with official 2025 grade boundaries. Calculate your IB scores for Math AA, Math AI, Biology, Chemistry, Physics, Economics, History, Psychology and more. May & November sessions.',
  keywords: [
    'IB score calculator',
    'IB grade calculator',
    'IB grade boundary 2025',
    'International Baccalaureate calculator',
    'Math AA grade boundary',
    'IB predicted grade',
  ],
  openGraph: {
    title: 'IB Score Calculator 2025 | Grade Boundary Calculator',
    description:
      'Calculate your IB grades instantly with official 2025 grade boundaries. Supports 15 subjects, May & November sessions.',
    url: 'https://ib-score-calculator.vercel.app',
    siteName: 'IB Score Calculator',
    type: 'website',
  },
  twitter: {
    card: 'summary',
    title: 'IB Score Calculator 2025',
    description: 'Free IB grade calculator with official 2025 grade boundaries.',
  },
  alternates: {
    canonical: 'https://ib-score-calculator.vercel.app',
  },
  icons: {
    icon: '/favicon.svg',
    shortcut: '/favicon.svg',
    apple: '/favicon.svg',
  },
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
      <body>
        {children}
        <Analytics />
      </body>
    </html>
  )
}
