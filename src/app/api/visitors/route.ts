import { NextResponse } from 'next/server'
import { createClient } from '@supabase/supabase-js'

export const dynamic = 'force-dynamic'

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!

export async function GET() {
  try {
    const supabase = createClient(supabaseUrl, supabaseAnonKey)
    const { data, error } = await supabase
      .from('visitor_count')
      .select('count')
      .eq('id', 1)
      .single()

    if (error) {
      console.error('visitor_count GET error:', error)
      return NextResponse.json({ page_views: 0 }, { status: 200 })
    }
    // DB 컬럼명은 count, 응답 필드명은 page_views
    const count = Number((data as { count?: number } | null)?.count ?? 0)
    return NextResponse.json({ page_views: count })
  } catch (e) {
    console.error(e)
    return NextResponse.json({ page_views: 0 }, { status: 200 })
  }
}

export async function POST() {
  try {
    const supabase = createClient(supabaseUrl, supabaseAnonKey)

    const { data, error: selectError } = await supabase
      .from('visitor_count')
      .select('count')
      .eq('id', 1)
      .single()

    if (selectError) {
      console.error('visitor_count POST select error:', selectError)
      return NextResponse.json({ page_views: 0 }, { status: 200 })
    }

    const currentCount = Number((data as { count?: number } | null)?.count ?? 0)
    const nextCount = currentCount + 1

    const { error: updateError } = await supabase
      .from('visitor_count')
      .update({ count: nextCount })
      .eq('id', 1)

    if (updateError) {
      console.error('visitor_count POST update error:', updateError)
      return NextResponse.json({ page_views: currentCount }, { status: 200 })
    }

    // 최신 값을 다시 읽어서 반환 (동시성 / 캐싱 이슈 방지)
    const { data: updated, error: verifyError } = await supabase
      .from('visitor_count')
      .select('count')
      .eq('id', 1)
      .single()

    if (verifyError) {
      console.error('visitor_count POST verify error:', verifyError)
      return NextResponse.json({ page_views: nextCount }, { status: 200 })
    }

    const finalCount = Number((updated as { count?: number } | null)?.count ?? nextCount)
    return NextResponse.json({ page_views: finalCount })
  } catch (e) {
    console.error(e)
    return NextResponse.json({ page_views: 0 }, { status: 200 })
  }
}
