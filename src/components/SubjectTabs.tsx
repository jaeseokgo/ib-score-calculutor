'use client'
import { SUBJECTS } from '@/lib/subjects'
import type { SubjectKey } from '@/types'
import clsx from 'clsx'

interface Props {
  selected: SubjectKey
  onSelect: (key: SubjectKey) => void
}

export default function SubjectTabs({ selected, onSelect }: Props) {
  return (
    <div className="w-full overflow-x-auto pb-1" style={{ scrollbarWidth: 'none' }}>
      <div className="flex gap-1 min-w-max px-4 md:px-0">
        {SUBJECTS.map((subject) => {
          const isActive = subject.key === selected
          return (
            <button
              key={subject.key}
              onClick={() => onSelect(subject.key)}
              className={clsx(
                'px-3 py-2 rounded-lg text-xs font-medium transition-all duration-200 whitespace-nowrap',
                isActive
                  ? 'text-[var(--text-on-accent)] font-semibold'
                  : 'text-[var(--text-2)] hover:text-[var(--text-1)] hover:bg-[var(--bg-3)]'
              )}
              style={
                isActive
                  ? {
                      background: 'var(--accent)',
                      fontFamily: 'var(--font-display)',
                    }
                  : { fontFamily: 'var(--font-display)' }
              }
            >
              {subject.shortName}
            </button>
          )
        })}
      </div>
    </div>
  )
}
