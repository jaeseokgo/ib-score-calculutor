'use client'

import { Suspense } from 'react'
import Calculator from '@/components/Calculator'

export default function Home() {
  return (
    <Suspense fallback={null}>
      <Calculator />
    </Suspense>
  )
}
